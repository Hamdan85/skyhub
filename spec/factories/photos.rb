FactoryGirl.define do
  factory :photo do
    trait :valid do
      picture File.open(Rails.root.join('spec', 'test_assets', 'b777_3.jpg'))
    end

    trait :invalid do
      picture_file_name { 'test.png' }
      picture_content_type { 'application/ppt' }
      picture_file_size { 1024 }
    end
  end
end
