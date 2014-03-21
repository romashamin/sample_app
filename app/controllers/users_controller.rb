class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end	

  def index
  	@user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      person = Pipedrive::Person.create( user_params )
      deal = {title: "_#{person.name}", stage_id: 39, person_id: person.id}
      Pipedrive::Deal.create(deal)
      redirect_to success_path
    else
      render 'new'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end

end
