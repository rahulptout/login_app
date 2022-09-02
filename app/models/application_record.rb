class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


   # before_validation :user_id_pass


   #   def user_id_pass
   #    binding.pry
   #    books.user_id = current_user.id
        
   #   end
end
