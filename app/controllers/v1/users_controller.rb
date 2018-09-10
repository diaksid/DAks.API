class V1::UsersController < V1::ApplicationController
  def index
    @models = User.all.order :id
    # respond_with @models, only: [:id, :name]
    render json: @models, only: [:id, :name]
  end


  def show
    @model = User.find params[:id]
    # respond_with @model, only: [:id, :name]
    render json: @model, only: [:id, :name]
  end
end
