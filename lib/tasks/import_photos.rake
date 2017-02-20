require './app/services/import_photos'

namespace :import_photos do
  desc "Import photos from remote server"
  task :import => :environment do
    p "Importing photos"
    photos = ImportPhoto.new
    photos.import
  end
end