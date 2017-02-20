require 'open-uri'

class Photo
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :picture,
                            :styles => {
                                :small    => ['320x240',   :jpg],
                                :medium   => ['384X288',    :jpg],
                                :large    => ['640X480',   :jpg]
                            }

  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def from_url(url)
    self.picture = open(url)
  end

  def small_picture
    picture(:small)
  end

  def medium_picture
    picture(:medium)
  end

  def large_picture
    picture(:large)
  end
end
