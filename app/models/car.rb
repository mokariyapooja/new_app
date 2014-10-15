class Car < ActiveRecord::Base
  
  ##paperclip attechment
  has_attached_file :image, :default_url => "assets/no_photo_image.png"

  ##validations 
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  validates :name, presence: true, uniqueness: true

  ##image base64 convert mathode
  def convert(image)
    cid = URI.unescape(image)
    filename = "image#{Time.now.to_i}"
    file = File.open("#{Rails.root.to_s}/tmp/#{filename}.png","wb")
    temp2 = Base64.decode64(cid)
    file.write(temp2)
    file.close
    f = File.open("#{Rails.root}/tmp/#{filename}.png")
    self.image = f
    f.close
    File.delete("#{Rails.root.to_s}/tmp/#{filename}.png")
  end

  ##for image url
  def image_url
    "#{DOMAIN_CONFIG}/#{self.image.url}"
  end

  ##for error masseges
  def display_errors
    self.errors.full_messages.join(', ')
  end
end
