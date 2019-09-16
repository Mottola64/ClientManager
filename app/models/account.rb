class Account < ApplicationRecord
    validates :name, :tier, :industry, :acv, presence: true

    belongs_to :user
    belongs_to :team

    has_many :deliverables
    
end
