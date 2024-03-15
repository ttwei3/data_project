class DogsController < ApplicationController
  def index
    @dogs = Dog.all

    if params[:breed_name].present?
      @dogs = @dogs.joins(:breed).where('breeds.breed_name LIKE ?', "%#{params[:breed_name]}%")
    end

    if params[:has_owner].present?
      if params[:has_owner] == 'true'
        @dogs = @dogs.joins(:owner)
      elsif params[:has_owner] == 'false'
        @dogs = @dogs.where(owner: nil)
      end
    end

    @dogs = @dogs.page(params[:page]).per(10)
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
