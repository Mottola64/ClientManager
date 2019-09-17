class Account < ApplicationRecord
    validates :name, :tier, :industry, :acv, presence: true

    belongs_to :user
    belongs_to :strategist, optional: true

    has_many :deliverables
    
end
