class Message < ActiveRecord::Base
  
  belongs_to :user

  validates_presence_of :body, :message => "Tienes que escribir el texto del mensaje"
end
