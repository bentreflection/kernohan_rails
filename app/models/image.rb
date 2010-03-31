class Image < ActiveRecord::Base
  is_attachment :recipes => { :thumb => [{ :thumbnail => { :size => '198x132'} }] }
end