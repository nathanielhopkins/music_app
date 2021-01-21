class ChangeColumnLiveAlbum < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :live_album, :boolean, null: true
  end
end
