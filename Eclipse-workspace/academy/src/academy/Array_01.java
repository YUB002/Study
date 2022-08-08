package academy;

public class Array_01 {
	public static void main(String[] args) {
		String a = "Hello"; //String은 기본형같은 참조형으로 많이 사용되기 때문에 예외적으로 new 생략가능

		//		int[] arr; //배열의 주소를 저장할 변수

		int[] arr = new int[4];  //new 키워드는 Heap 메모리를 사용하겠다는 문법
		//new 기능 1. Heap메모리에 4개 배열 만들고 2. 만들어진 공간의 주소
		// int a = new int[4]; 불가능
		//String a = new int[4];불가능 

		arr[1] =10;
		arr [0] = 1;
		arr [2] = 100;
		arr [3] = 1000;

		//int[] arr = new int[] {1,10,100,1000}; 초기값을 넣고싶다면 배열 사이즈를 적지 말아야 함
		
		
		System.out.println("배열의 크기 : " + arr.length);
		
		
		for(int i =0;i<arr.length;i++) {
			System.out.println(arr[i]);
		}
		//  =
		//		System.out.println(arr[0]);
		//		System.out.println(arr[1]);
		//		System.out.println(arr[2]);
		//		System.out.println(arr[3]);

	}
}
