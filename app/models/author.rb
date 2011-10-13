class Author < ActiveRecord::Base
   validates_presence_of :name
    belongs_to :User
end