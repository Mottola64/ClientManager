class Account < ApplicationRecord
    belongs_to :user
    has_many :deliverables, dependent: :destroy
    validates :name, :tier, :industry, :acv, :strategist, presence: true
    accepts_nested_attributes_for :deliverables
 end
