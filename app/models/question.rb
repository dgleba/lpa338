class Question < ActiveRecord::Base
  belongs_to :question_list
  belongs_to :survey
end
