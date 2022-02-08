class AdvertismentsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: [:index, :selection]
  def index
    @advertisments = Advertisment.where state: "published"
    if @advertisments == nil
    @advertisments = []
    end
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
    @advertisment = Advertisment.find(params[:id])
    @advertisment.destroy
    redirect_to advertisments_path
  end

  def selection
    @personal_advertisments = Advertisment.where user_id: current_user.id
  end

  def admin_list
    @advertisments = Advertisment.where state: "in_considered"
  end  

  private
    def advertisment_params
      params.require(:advertisment).permit(:title, :body, :state, :state_event, {image: []})
    end
end