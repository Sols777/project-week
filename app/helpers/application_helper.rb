module ApplicationHelper
  def cloudinary_pic(venue)
    if venue.photo.attached?
      cl_image_tag venue.photo.key, height: 300, width: 400, crop: :fill
    else
      image_path 'https://i0.wp.com/thinkfirstcommunication.com/wp-content/uploads/2022/05/placeholder-1-1.png?w=1200&ssl=1', height: 300, width: 400, crop: :fill
    end
    # comment
  end
end
