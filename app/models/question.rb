class Question < ActiveRecord::Base
  belongs_to :survey
 

  has_many :choices, inverse_of: :question
  accepts_nested_attributes_for :choices, reject_if: :all_blank, allow_destroy: true

  
  def to_s
    # show columns contents, not record object like:  #<Vehicle:0x007f343b3f2890> 2016-06-08  Details Edit  Delete
    # http://stackoverflow.com/questions/4829909/how-do-i-print-out-the-contents-of-an-object-in-rails-for-easy-debugging
    #"Name:#{self.name} Age:#{self.age} Weight: #{self.weight}"
    "##{id},#{name}"
  end

end
