class AddPages < ActiveRecord::Migration
  def self.up
    add_column :snippets, :nav_title, :string
    add_column :snippets, :tagline, :string
    add_column :snippets, :header_title, :string
  end

  def self.down
    remove_column :snippets, :header_title
    remove_column :snippets, :nav_title
    remove_column :snippets, :tagline
  end
end
