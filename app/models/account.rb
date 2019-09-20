class Account < ApplicationRecord
    belongs_to :user
    has_many :deliverables
    validates :name, :tier, :industry, :acv, :strategist, presence: true
 end
