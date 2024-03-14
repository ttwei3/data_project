# config/initializers/geocoder.rb
Geocoder.configure(
  #Use Google's geocoding service
  lookup: :google,
  #api key
  api_key: 'AIzaSyD4SsS7L7lBrQtih7D2fXkuisfG-d37HlU',
  #Set request timeout (seconds)
  timeout: 5
)
