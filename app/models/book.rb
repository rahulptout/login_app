class Book < ApplicationRecord
  belongs_to :user
  # cattr_accessor :user  # it's accessible outside Comment
  # attr_accessor :book 
  before_validation :user_id_pass,on: :update
 
 


  def user_id_pass
  	 # binding.pry
     self.user_id = user_id

  end




  # def assign_user
  #   self.book = self.user.id
  # end

end

