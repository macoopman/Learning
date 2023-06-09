package lambda;

import java.util.Arrays;

import java.util.*;
import javax.swing.Timer;
import javax.swing.*;

public class LambdaTest {
    public static void main(String[] args)
    {
        var planets = new String[] {"Mercury", "Venus", "Earth", "Mars", "jupiter", "Saturn", "Uranus", "Neptune"};

        System.out.println(Arrays.toString(planets));
        System.out.println("Sorted in dictionary order:");
        Arrays.sort(planets);

        System.out.println(Arrays.toString(planets));

        System.out.println("Sorted By Length:");
        Arrays.sort(planets, (first, second) -> first.length() - second.length());

        System.out.println(Arrays.toString(planets));

        var timer = new Timer(1000, event -> System.out.println("The time is " + new Date()));

        timer.start();

        JOptionPane.showMessageDialog(null, "Quit Program?");
        System.exit(0);
    }
}
