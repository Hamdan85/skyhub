require 'rails_helper'
require 'import_photos'

describe ImportPhoto do
  let (:photo_import) { ImportPhoto.new }

  it "must retrieve some photos on initialization" do
    expect(photo_import.json).to be_a(Hash)
  end

  it "should import photos to db creating its resized versions" do
    json_size = photo_import.json["images"].size
    expect{ photo_import.import }.to change{ Photo.count }.by(json_size)
  end
end
