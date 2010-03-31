class AddImageIdToPage < ActiveRecord::Migration
  def self.up
    add_column :snippets, :image_id, :integer
    create_table "images", :force => true do |t|
      t.column :filename, :string
      t.column :created_at, :datetime
    end
  end

  def self.down
    remove_column :snippets, :image_id
    drop_table "images"
  end
end
