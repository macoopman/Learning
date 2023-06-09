package Employee;

import java.util.ArrayList;

public class EmployeeTest{
    public static void main(String[] args){
        var staff = new ArrayList<Employee>();

        staff.add(new Employee("Carl Cracker", 80000, 1987, 12, 15));
        staff.add(new Employee("Harry Hacker", 50000, 1989,10, 1));
        staff.add(new Employee("Tony Tester", 40000, 1990,3, 15));
        
        for (Employee e : staff){
            e.raiseSalary(5);
        }

        for (Employee e : staff){
            System.out.println("Name: " + e.getName() + " ,Salary: " + e.getSalary() + ", hireday: " + e.getHireDay());
        }
        
    }    
}