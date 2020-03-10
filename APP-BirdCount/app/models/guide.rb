class Guide < ActiveRecord::Base
    belongs_to :user
    validates :bird, :description, :date, presence: true
end