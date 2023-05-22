public class IterableTest{
	public static void main(String[] args){
		var myList = new List<String>();

		myList.add("hello");
		myList.add("world");
		myList.add("i");
		myList.add("am lowercase");

		myList.forEachRemaining(e -> System.out.println(e.toUpperCase()));

	}
}
