package Employee;

public class Manager extends Employee{

    private double bonus;
    
    public Manager(String name, double salary, int year, int month, int day) {
        super(name, salary, year, month, day);
        this.bonus = 0;
    }
   
    public void setBonus(double bonus){
        this.bonus = bonus;
    }

    public double getSalary(){
        return super.getSalary() + bonus;
    }

    @Override
    public boolean equals(Object otherObject){
        if (!super.equals(otherObject)) return false;

        Manager other = (Manager) otherObject;
        return bonus == other.bonus;
        
    }
}
