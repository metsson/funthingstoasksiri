# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :string(255)      not null
#  hits       :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base

    after_find do |question|
        question.hits += 1
    end
end
