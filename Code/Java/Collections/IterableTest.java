import java.util.*;

public class IterableTest{
	public static void main(String[] args){
		var myList = new ArrayList<String>();

		myList.add("hello");
		myList.add("world");
		myList.add("i");
		myList.add("am lowercase");

		myList.iterator().forEachRemaining(e -> System.out.println(e.toUpperCase() + " "));

	}
}
