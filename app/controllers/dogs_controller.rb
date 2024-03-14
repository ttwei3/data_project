class DogsController < ApplicationController
  def index
    @dogs = Dog.includes(:owner, :breed).all
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
