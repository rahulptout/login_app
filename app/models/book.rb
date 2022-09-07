class Book < ApplicationRecord
  belongs_to :user
  # cattr_accessor :user  # it's accessible outside Comment
  # attr_accessor :book 
  before_validation :user_id_pass,on: [:update]
  # validates :auther_name, format: {with: /\A[a-zA-Z]+\z/, message: 'only letters are allowed'}
   validate :current_date,on: [:create]
   validate :days_count
  before_validation :default_due_date

  def user_id_pass
     book = Book.find(id)
     self.user_id = book.user_id
  	
      
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

    def default_due_date
   
     self.due_date = issue_date + 20.day
     
    end


    def days_count
    if day =  return_date.day - issue_date.day
      # binding.pry
       if day>20
         errors.add(:return_date, " is not more than 20 days")
       end  
    else
      errors.add(:return_date, "enter return date accept")
    end  
  end

  def count_penalty
    if Date.today > due_date
        penalty_days =  due_date.day - due_date.day
        
         penalty = (penalty_days)*10
         return penalty
    else 
        return return_date

    end 

  end


  # def assign_user
  #   self.book = self.user.id
  # end

end

