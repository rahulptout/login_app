class Book < ApplicationRecord
  belongs_to :user
  # cattr_accessor :user  # it's accessible outside Comment
  # attr_accessor :book 
  # before_validation :global_user
 


  # def global_user(id)
  # 	# binding.pry
  #   # Book.user_id = current_user.id
  #    # @user = User.find(params[:id])
  #      # id
  #     # binding.pry
     
  # end




  # def assign_user
  #   self.book = self.user.id
  # end

end

