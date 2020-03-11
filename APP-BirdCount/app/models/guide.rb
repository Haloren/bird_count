class Guide < ActiveRecord::Base
    belongs_to :user
    validates :bird, :notes, :date, presence: true
end