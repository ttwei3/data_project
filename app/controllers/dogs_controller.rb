class DogsController < ApplicationController
  def index
    @dogs = Dog.includes(:breed, :owner)

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @dogs = @dogs.left_outer_joins(:breed, :owner).where(
        'dogs.dog_name LIKE :search OR breeds.breed_name LIKE :search OR owners.owner_name LIKE :search',
        search: search_term
      )
    end

    if params[:has_owner].present?
      if params[:has_owner] == 'true'
        @dogs = @dogs.where.not(owner_id: nil)
      elsif params[:has_owner] == 'false'
        @dogs = @dogs.where(owner_id: nil)
      end
    end

    @dogs = @dogs.page(params[:page]).per(10)
  end

  def show
    @dog = Dog.find(params[:id])
  end
end