class DogsController < ApplicationController
  def index
    @dogs = Dog.includes(:owner, :breed).all
  end
end
