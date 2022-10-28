class Ticket < ApplicationRecord
  has_many :employeetickets
  has_many :employees, through: :employeetickets
end