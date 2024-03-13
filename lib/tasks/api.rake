namespace :api do
  desc "Fetch breeds and a random image for each main breed from Dog API"
  task fetch_breeds_with_images: :environment do
    require 'net/http'
    require 'json'

    # get all breeds
    breeds_url = URI("https://dog.ceo/api/breeds/list/all")
    breeds_response = Net::HTTP.get(breeds_url)
    breeds = JSON.parse(breeds_response)['message']

    breeds.each do |breed, _sub_breeds|
      breed_name = breed.capitalize

      # create record for every breed
      breed_record = Breed.create(breed_name: breed_name) 

      # get the random image and save it
      fetch_and_save_image_for_breed(breed, breed_record)
    end

    puts "Breeds data and images fetched and saved."
  end

  def fetch_and_save_image_for_breed(breed, breed_record)
    # get the random image
    image_url = URI("https://dog.ceo/api/breed/#{breed}/images/random")
    image_response = Net::HTTP.get(image_url)
    image_data = JSON.parse(image_response)

    # update the record
    if image_data['status'] == 'success'
      breed_record.update(image: image_data['message'])
    end
  end
end
