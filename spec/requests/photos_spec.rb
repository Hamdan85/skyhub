require 'rails_helper'

RSpec.describe "Photos", type: :request do
  # Scenarion: Index
  #   As an API consumer
  #   I want to visit a index endpoing
  #   So I can get images with their respective formats
  scenario "consumer requests index of photos" do
    10.times do create(:photo, :valid) end

    get '/api/v1/photos'
    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['photos'].size).to eq(10)
  end
end
