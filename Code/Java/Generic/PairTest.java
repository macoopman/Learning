public class PairTest{
	
	public static void main(String[] args){
		String[] words = { "Mary", "had", "a", "little", "lamb"};

		Pair<String> mm = ArrayAlg.minmax(words);

		System.out.println("min = " + mm.getFirst());
	
		System.out.println("max  = " + mm.getSecond());


		String middle = ArrayAlg.<String>getMiddle( "John", "Q", "Public");
		System.out.println("Middle = " + middle);
	}
}


class ArrayAlg{

	public static <T> T getMiddle(T... a){
		return a[a.length / 2];
	}

	public static Pair<String> minmax(String[] a){
		if (a == null || a.length == 0 )
			return null;

		String min = a[0];
		String max = a[0];

		for (int i = 0; i < a.length; i++){
			if (min.compareTo(a[i]) > 0)
				min = a[i];

			if (max.compareTo(a[i]) < 0)
				max = a[i];
		}

		return new Pair<String>(min, max);
	}
}
