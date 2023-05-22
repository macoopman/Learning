package TimePrinter;

import javax.swing.*;

public class TimerPrinterTest {
    public static void main(String[] args) {
        var listener = new TimePrinter();
        Timer t = new Timer(1000, listener);

        t.start();

        JOptionPane.showMessageDialog(null, "Quit program?");
        System.exit(0);
    }
}
