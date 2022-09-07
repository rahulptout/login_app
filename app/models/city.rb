class City < ApplicationRecord
	has_one :user


   def self.admin(obj)
    # binding.pry
       obj.city.city_name
   end 

  



end
