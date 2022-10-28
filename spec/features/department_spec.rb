require 'pry'

RSpec.describe 'department', type: :feature do
  describe 'as a user' do
    describe 'when I visit the Department index page' do
      it "shows me the name and floor" do
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

        visit "/departments"
        save_and_open_page

        expect(page).to have_content(james.name)
        expect(page).to have_content(joseph.name)
      end
    end
  end
end