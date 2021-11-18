require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { city: @employee.city, cnic: @employee.cnic, current_address: @employee.current_address, dob: @employee.dob, doj: @employee.doj, father_spouse_name: @employee.father_spouse_name, image: @employee.image, job_rank: @employee.job_rank, martial_status: @employee.martial_status, mobile: @employee.mobile, name: @employee.name, permanent_address: @employee.permanent_address, phone: @employee.phone, remarks: @employee.remarks, status: @employee.status, store_configuration_id: @employee.store_configuration_id } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { city: @employee.city, cnic: @employee.cnic, current_address: @employee.current_address, dob: @employee.dob, doj: @employee.doj, father_spouse_name: @employee.father_spouse_name, image: @employee.image, job_rank: @employee.job_rank, martial_status: @employee.martial_status, mobile: @employee.mobile, name: @employee.name, permanent_address: @employee.permanent_address, phone: @employee.phone, remarks: @employee.remarks, status: @employee.status, store_configuration_id: @employee.store_configuration_id } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
