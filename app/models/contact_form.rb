class ContactForm
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :email, :subject, :message,
                :recaptcha

  validates_presence_of :email, :message, :recaptcha
  validates_format_of :email,
                      with: /[a-z0-9][a-z0-9\-_.]+@([a-z]|[a-z0-9]?[a-z0-9\-]+[a-z0-9])\.[a-z0-9]{2,10}(?:\.[a-z]{2,10})?/i
  validates_length_of :subject,
                      in: 3..64,
                      allow_blank: true
  validates_length_of :message,
                      in: 3..256
  validates_length_of :recaptcha,
                      is: 292
end
