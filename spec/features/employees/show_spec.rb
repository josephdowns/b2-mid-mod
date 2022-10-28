require 'pry'

RSpec.describe "employees", type: :feature do
  before :each do
    department = Department.create!(name: "Human Services", floor: 1)
    @joseph = Employee.create!(name: "Joseph", level: 5, department_id: department.id)
    tix1 = Ticket.create!(subject: "Call patient", age: 2)
    tix2 = Ticket.create!(subject: "Mop floor", age: 10)
    tix3 = Ticket.create!(subject: "Make goodie bags", age: 7)
    EmployeeTicket.create!(employee_id: @joseph.id, ticket_id: tix1.id)
    EmployeeTicket.create!(employee_id: @joseph.id, ticket_id: tix2.id)
    EmployeeTicket.create!(employee_id: @joseph.id, ticket_id: tix3.id)

  end
  describe 'employee show page' do
    it 'shows the employee name and department' do
      visit "/employees/#{@joseph.id}"

      expect(page).to have_content("Joseph")
      expect(page).to have_content("Human Services")
    end

    it 'shows the tickets assigned to employee' do
      visit "/employees/#{@joseph.id}"

      expect(page).to have_content("Call patient")
      expect(page).to have_content("Mop floor")
      expect(page).to have_content("Make goodie bags")
    end
  end
end