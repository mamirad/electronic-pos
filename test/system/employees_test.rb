require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "City", with: @employee.city
    fill_in "Cnic", with: @employee.cnic
    fill_in "Current address", with: @employee.current_address
    fill_in "Dob", with: @employee.dob
    fill_in "Doj", with: @employee.doj
    fill_in "Father spouse name", with: @employee.father_spouse_name
    fill_in "Image", with: @employee.image
    fill_in "Job rank", with: @employee.job_rank
    fill_in "Martial status", with: @employee.martial_status
    fill_in "Mobile", with: @employee.mobile
    fill_in "Name", with: @employee.name
    fill_in "Permanent address", with: @employee.permanent_address
    fill_in "Phone", with: @employee.phone
    fill_in "Remarks", with: @employee.remarks
    fill_in "Status", with: @employee.status
    fill_in "Store configuration", with: @employee.store_configuration_id
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "City", with: @employee.city
    fill_in "Cnic", with: @employee.cnic
    fill_in "Current address", with: @employee.current_address
    fill_in "Dob", with: @employee.dob
    fill_in "Doj", with: @employee.doj
    fill_in "Father spouse name", with: @employee.father_spouse_name
    fill_in "Image", with: @employee.image
    fill_in "Job rank", with: @employee.job_rank
    fill_in "Martial status", with: @employee.martial_status
    fill_in "Mobile", with: @employee.mobile
    fill_in "Name", with: @employee.name
    fill_in "Permanent address", with: @employee.permanent_address
    fill_in "Phone", with: @employee.phone
    fill_in "Remarks", with: @employee.remarks
    fill_in "Status", with: @employee.status
    fill_in "Store configuration", with: @employee.store_configuration_id
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
