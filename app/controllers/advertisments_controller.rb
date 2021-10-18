class AdvertismentsController < ApplicationController

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
  end

  private
    def advertisment_params
      params.require(:advertisment).permit(:title, :body)
    end
end