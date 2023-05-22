import java.util.Scanner;

public class InputTest{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter Name: ");
        var name = scanner.nextLine();

        System.out.print("Age: ");
        var age = scanner.nextInt();

        System.out.println("Hello " + name + " you are " + age + " years old");
    }
}