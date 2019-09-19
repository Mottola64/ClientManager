class Account < ApplicationRecord
    belongs_to :user
    has_many :deliverables
    #accepts_nested_attributes_for :deliverables
    validates :name, :tier, :industry, :acv, presence: true
    validates :deliverables, presence: optional
    #validates_associated :deliverables
 end
