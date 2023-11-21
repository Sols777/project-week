module ApplicationHelper
  def cloudinary_pic(venue)
    if venue.photo.attached?
      cl_image_tag venue.photo.key, height: 300, width: 400, crop: :fill
    else
      image_path 'https://thinkfirstcommunication.com/placeholder-1-png/', height: 300, width: 400, crop: :fill
    end
  end
end
