module ApplicationHelper
  def display_avatar(user)
    unless user.avatar.nil?
      image_tag(user.avatar.file_name)
    else
      image_tag("/images/empty.jpg")
     end
  end
  ## ...
#(?:http:\/\/www\.|http:\/\/|www\.)(?:youtube\.com\/watch\?v=(?:\w+)|domain\.com\/image.(?:jpg|png|gif)|domain\.com)
#/(https:\/\/w{3}.youtube.com\/watch\?v=\w*)/
#{}/(youtu\.be\/|youtube\.com\/(watch\?(.*&)?v=|(embed|v)\/))([^\?&"'>]+)/
  def embed(string)
    text, link = string.partition(/(?:http:\/\/www\.|https:\/\/|www\.)(?:youtube\.com\/watch\?v=(?:\w+)|domain\.com\/image.(?:jpg|png|gif)|domain\.com)/)
    text_html = text.empty? ? nil : content_tag(:p, text.gsub("https://", ""))
    iframe = link.empty? ? nil : content_tag(:iframe, nil, {src: embed_code(link)},:allowFullScreen => "true")
    text_html + iframe
  end

  def embed_code(string)
    code = string.split("v=").last
    "https://www.youtube.com/embed/#{code}"
  end


end
