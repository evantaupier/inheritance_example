class Employee
  attr_reader :first_name, :last_name, :active
  attr_writer :active

  def initialize(input_options)
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
end

employee1 = Employee.new({ first_name: "Majora", last_name: "Carter", salary: 80000, active: true })
employee2 = Employee.new({ first_name: "Damilo", last_name: "Campos", salary: 70000, active: true })

class Manager < Employee
  attr_reader :employees

  def initialize(input_options)
    super
    @employees = input_options[:employees]
  end

  def send_report
    puts "sending emial..."
    # use email sending library
    puts "email sent!"
  end

  def give_all_raises
    puts "give many moneys"
    index = 0
    @employees.each do |employee|
      employee.give_annual_raise
    end
  end
end

manager = Manager.new(first_name: "Sharon", last_name: "Jacobs", salary: 100000, active: true, employees: [employee1, employee2])
manager.print_info
manager.send_report
pp manager.employees
manager.give_all_raises
pp manager.employees
