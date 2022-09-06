class Book < ApplicationRecord
  belongs_to :user
  # cattr_accessor :user  # it's accessible outside Comment
  # attr_accessor :book 
  before_validation :user_id_pass,on: :update
  # validates :auther_name, format: {with: /\A[a-zA-Z]+\z/, message: 'only letters are allowed'}
   validate :current_date, :days_count


  def user_id_pass
  	 # binding.pry
     self.user_id = user_id

  end


  def current_date
    if self.issue_date.present?
       if Date.today != issue_date
         errors.add(:issue_date, "only current date accept")
       end  
    else
      errors.add(:issue_date, "enter current date accept")
    end  
  end



    def days_count
    if month =  return_date.month- issue_date.month
      # binding.pry
       if month>0
         errors.add(:return_date, "only current month")
       end  
    else
      errors.add(:return_date, "enter return date accept")
    end  
  end

  def count_penalty
    if Date.today > return_date
        penalty_days =  Date.today.day - return_date.day
        
         penalty = (penalty_days-1)*10
         return penalty
    else 
        return return_date

    end 

  end


  # def assign_user
  #   self.book = self.user.id
  # end

end

