class Record < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :year
end
