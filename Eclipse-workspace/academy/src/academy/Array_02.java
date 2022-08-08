package academy;

public class Array_02 {
	public static void main(String[] args) {
		//char 형 배열 3칸짜리를 만들고 'A', 'F', 'Z' 담아보세요
		char [] arr1 = new char[] {'A', 'F', 'Z'};

		//String 형 배열 2칸짜리를 만들고 "Hello", "Array"담아보세요
		String [] arr2 = new String [] {"Hello", "Array"};		

		//int형 배열 arr3을 100칸짜리로 만들고 100~1역순으로 담아보세요.
		int []arr3 = new int[100];
		for(int i =0;i<arr3.length;i++) {
			arr3[i] = 100-i;
		}
		System.out.println(arr3[99]); //1;
		System.out.println(arr3[0]); //100;

		//char형 배열 arr4를 26칸짜리로 만들고 A-Z 또는 Z-A까지 담아보세요.
		char [] arr4 = new char[26];
		for(char i = 'Z'; i<arr4.length;i++) {
			arr4[i] = 'Z';
		}
		System.out.println(arr4[0]);

	}
}
