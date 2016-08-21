module ApplicationHelper
  def display_avatar(user)
    unless user.avatar.nil?
      image_tag(user.avatar.file_name)
    else
      image_tag("/images/empty.jpg")
     end
  end
  ## ...

  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
end
end
