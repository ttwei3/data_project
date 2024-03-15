class DogsController < ApplicationController
  def index
    @dogs = if params[:breed_name].present?
              Dog.joins(:breed).where('breeds.breed_name LIKE ?', "%#{params[:breed_name]}%").page(params[:page]).per(10)
            else
              Dog.page(params[:page]).per(10)
            end
  end


  def show
    @dog = Dog.find(params[:id])
  end
end
