class AddNavElement < ActiveRecord::Migration
  def self.up
    add_column :snippets, :nav_item, :boolean
    add_column :snippets, :nav_position, :integer
    add_column :snippets, :core_page, :boolean
  end

  def self.down
    remove_column :snippets, :core_page
    remove_column :snippets, :nav_item
    remove_column :snippets, :nav_position
  end
end
