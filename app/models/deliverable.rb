class Deliverable < ApplicationRecord
    belongs_to :account
    scope :sorted_by_due_date, -> {order :due_date}
end
