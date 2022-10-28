class Employee < ApplicationRecord
  belongs_to :department
  has_many :employeetickets
  has_many :tickets, through: :employeetickets
end