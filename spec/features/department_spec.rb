require 'pry'

RSpec.describe 'department', type: :feature do
  describe 'as a user' do
    describe 'when I visit the Department index page' do
      it "shows me the name and floor" do
        EmployeeTicket.destroy_all
        Employee.destroy_all
        Department.destroy_all
        department = Department.create!(name: 'IT', floor: 5)
        
        visit "/departments"

        expect(page).to have_content(department.name)
        expect(page).to have_content(department.floor)
        
      end

      it "shows me the employees of said department" do
        Employee.destroy_all
        Department.destroy_all
        department = Department.create!(name: 'IT', floor: 5)
        james = Employee.create!(name: 'James', level: 10, department_id: department.id)
        joseph = Employee.create!(name: 'Joseph', level: 5, department_id: department.id)
        tix = Ticket.create!(subject: 'Printer broke', age: 6)
        EmployeeTicket.create!(employee_id: joseph.id, ticket_id: tix.id)

        visit "/departments"

        expect(page).to have_content(james.name)
        expect(page).to have_content(joseph.name)
      end
    end
  end
end