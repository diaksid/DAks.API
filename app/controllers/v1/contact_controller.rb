class V1::ContactController < V1::ApplicationController
  def deliver
    @model = ContactForm.new deliver_params
    if @model.valid?
      if check_recaptcha @model.recaptcha
        if ContactMailer.contact_form(@model).deliver
          status = 200
          data = {message: I18n.t('contact.deliver.success')}
        else
          status = 500
          data = {message: I18n.t('contact.deliver.errors.deliver')}
        end
      else
        status = 206
        data = {message: I18n.t('contact.deliver.errors.recaptcha')}
      end
    else
      status = 206
      data = {message: I18n.t('contact.deliver.errors.validation')}
    end
    render json: data, status: status
  end


  private


  def deliver_params
    params.require(:contact).permit(:email, :subject, :message, :recaptcha)
  end


  def check_recaptcha(token)
    response = HTTP.post('https://www.google.com/recaptcha/api/siteverify', form: {
      secret: ENV['RECAPTCHA_SECRET_KEY'],
      response: token
    }, params: {json: true})
    response.parse['success'] if response.code === 200
  end
end
