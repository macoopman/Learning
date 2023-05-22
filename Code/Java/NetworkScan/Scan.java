import java.net.InetAddress;
import java.net.Socket;



public class Scan{

	public static void main(String[] args){
		
		String subnet = "192.168.1";
		int timeout = 1000;

		for (int i = 0; i <= 255; i++){
			String host = subnet + "." + i;


			try{
				InetAddress address = InetAddress.getByName(host);
				if (address.isReachable(timeout)){
					System.out.println(host + " is reachable");
				}

				try
				{
					Socket socket = new Socket(host, 80);
					System.out.println(" HTTP service running on " + host);
					socket.close();
				}
				catch(Exception ex)
				{

				} 
			}
			catch(Exception ex){
			}
		}
	}
}
