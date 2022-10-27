module EmailReportable
  def send_report
    puts "sending emial..."
    # use email sending library
    puts "email sent!"
  end
end

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

  include EmailReportable

  def fire_all_employees
    puts "go away"
    @employees.each do |employee|
      employee.active = false
    end
  end
end

manager = Manager.new(first_name: "Sharon", last_name: "Jacobs", salary: 100000, active: true, employees: [employee1, employee2])
manager.print_info
manager.send_report

class Intern < Employee
  include EmailReportable
end

intern = Intern.new(first_name: "Adrienne", last_name: "Lowe", salary: 50000, active: true)
intern.print_info
