class City < ApplicationRecord
	has_one :user


    def self.admin(obj)
       obj.city.city_name
   end 


end
