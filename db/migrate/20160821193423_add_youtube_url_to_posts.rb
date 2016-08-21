class AddYoutubeUrlToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :youtube_url, :text
  end
end
