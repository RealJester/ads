class AdvertismentsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :index
  def index
    @advertisments = Advertisment.all
  end	

  def show
    @advertisment = Advertisment.find(params[:id])	
  end	

  def new
    @advertisment = Advertisment.new
  end	

  def edit
    @advertisment = Advertisment.find(params[:id])
  end	

  def create
  	@advertisment = current_user.advertisments.build(advertisment_params)

    if @advertisment.save
      redirect_to @advertisment
    else
      render :new, status: :unprocessable_entity
    end
  end	

  def update
    @advertisment = Advertisment.find(params[:id])
    if @advertisment.update(advertisment_params)
      redirect_to @advertisment
    else
      render :edit, status: :unprocessable_entity
    end
  end	

  def destroy
    @advertisment.destroy
    redirect_to advertisments_path
  end

  private
    def advertisment_params
      params.require(:advertisment).permit(:title, :body)
    end
end