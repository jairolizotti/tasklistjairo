class Task < ActiveRecord::Base
   belongs_to :author
   belongs_to :category
 
   validates_presence_of :description
   validates_presence_of :status
   validates_presence_of :author
   validates_presence_of :category
 
end