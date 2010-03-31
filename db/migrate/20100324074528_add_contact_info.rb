class AddContactInfo < ActiveRecord::Migration
  def self.up
    create_table :contact_infos, :force => true do |t|
      t.string :slug
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
    end        
  end

  def self.down
    drop_table :contact_infos
  end
end
