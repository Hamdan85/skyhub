require 'rails_helper'

RSpec.describe Photo, type: :model do

  it "must not accept non image files" do
    photo = build(:photo, :invalid)
    expect(photo).to be_invalid
  end

  it "must create small, medium and large formats of image" do
    photo = create(:photo, :valid)

    expect(photo).to respond_to(:small_picture)
    expect(photo).to respond_to(:medium_picture)
    expect(photo).to respond_to(:large_picture)
  end
end
