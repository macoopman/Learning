import java.util.*;
import java.util.concurrent.locks.*;

public class Bank{
	private final double[] accounts;

	public Bank(int numOfAccounts, double initialBalance)
	{
		this.accounts = new double[numOfAccounts];
		Arrays.fill(accounts, initialBalance);
	}

	public synchronized void transfer(int from, int to , double amount) throws InterruptedException
	{
		while (accounts[from] < amount)
			wait();

		accounts[from] -= amount;
		accounts[to] += amount;
		notifyAll();
	}

	public synchronized double getTotalBalance(){
		double sum = 0;

		for (double a : accounts)
			sum += a;

		return sum;
	}

	public int size(){
		return accounts.length;
	}
}
