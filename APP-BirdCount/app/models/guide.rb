class Guide < ActiveRecord::Base
    belongs_to :user
    validates :bird, :notes, :date, presence: true #remove notes, because not all birds have to have a note
end