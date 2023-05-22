import java.awt.*;
import java.awt.event.*;
import java.time.*;

import javax.swing.*;


public class InnerClassTest
{
	public static void main(String[] args)
	{
		var clock = new TalkingClock();
		clock.start(1000, true);

		JOptionPane.showMessageDialog(null, "Quit program!");
		System.exit(0);
		
	}

}


class TalkingClock
{
	private int interval;
	private boolean beep;

	public void start(int interval, boolean beep)
	{
		class TimePrinter implements ActionListener
		{
			public void actionPerformed(ActionEvent event)
			{
				System.out.println("At the tone, the time is " + Instant.ofEpochMilli(event.getWhen()));

				if (beep)
					Toolkit.getDefaultToolkit().beep();
			}
		}

		var listener = new TimePrinter();
		var timer = new Timer(interval, listener);
		timer.start();
	}
}
