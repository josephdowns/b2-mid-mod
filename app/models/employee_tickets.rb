class EmployeeTickets < ApplicationRecord
  belongs_to :ticket
  belongs_to :employee
end