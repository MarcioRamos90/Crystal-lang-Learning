class Person
    property name : String
    def initialize(@name)
    end
end
class Employee < Person
    property salary = 0
end

person = Person.new("Alan")
employee = Employee.new("Helen")
employee.salary = 10000
p person.is_a? Person # true
p employee.is_a? Person # true
p person.is_a? Employee # false

class Employee
    def yearly_salary
        12 * @salary
    end
end

class SalesEmployee < Employee
    property bonus = 0
    def yearly_salary
        super + @bonus
    end
end

employee1 = Employee.new("Helen")
employee1.salary = 5000
employee2 = SalesEmployee.new("Susan")
employee2.salary = 4000
employee2.bonus = 20000
employee3 = Employee.new("Eric")
employee3.salary = 4000
employee_list = [employee1, employee2, employee3]

employee_list.each do |employee|
    puts "#{employee.name}'s yearly salary is $#{employee.
    yearly_salary.format(decimal_places: 2)}"
end