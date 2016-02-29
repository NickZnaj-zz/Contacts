class UsersController < ApplicationController
  def index
    # render text: "I am in the index action!"
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    attributes = (user_params)
    user = User.find(params[:id])
    user.update(attributes)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    render json: user

    User.delete(user.id)
  end

  private
  def user_params
    params[:user].permit(:username)
  end
end
