class Contact < ActiveRecord::Base
  
  validates_presence_of :phone
  validates_uniqueness_of :phone
  validates_format_of :phone, :with => /^6\d{8}$/
end
