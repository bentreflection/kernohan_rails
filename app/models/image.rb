class Image < ActiveRecord::Base
  is_attachment :recipes => { :thumb => [{ :thumbnail => { :size => '198x132'} }] }, 
                :storage_options => {:root => File.join(Rails.root, "public", "assets", table_name)}
end