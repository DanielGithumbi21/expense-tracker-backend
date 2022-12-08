class Spending < ApplicationRecord
    belongs_to :user
    validates :income, presence: true
    validates :budget, presence: true
end
