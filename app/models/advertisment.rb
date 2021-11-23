class Advertisment < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true

  state_machine :state, :initial => :drafted do

    event :written do
      transition :drafted => :in_considered
    end

    event :rejection do
      transition :in_considered => :rejected
    end

    event :approval do
      transition :in_considered => :approved
    end

    event :correction do
      transition [:rejected, :archived] => :in_considered
    end

    event :keeping do 
      transition [:rejected, :archived] => :drafted
    end

    event :publish do
      transition :approved => :published
    end

    event :archiving do
      transition :published => :archived
    end
  end
end
