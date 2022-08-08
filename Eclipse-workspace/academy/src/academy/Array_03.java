package academy;

import java.util.Scanner;

public class Array_03 {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int []arr = new int[4];

		for(int i=0;i<arr.length;i++) {
			System.out.print((i+1)+" 번째 값 : ");
			arr[i] =Integer.parseInt(sc.nextLine());
		}
		//		=
		//			System.out.print("첫 번째 값: ");
		//			arr[0] = Integer.parseInt(sc.nextLine());
		//			
		//			System.out.print("두 번째 값: ");
		//			arr[1] = Integer.parseInt(sc.nextLine());
		//			
		//			System.out.print("세 번째 값: ");
		//			arr[2] = Integer.parseInt(sc.nextLine());
		//			
		//			System.out.print("네 번째 값: ");
		//			arr[3] = Integer.parseInt(sc.nextLine());

		for(int i=0;i<arr.length;i++) {
			System.out.println((i+1)+" 번째 값 : "+arr[i]);
		}

		System.out.println("첫 번째 값: " + arr[0]);
		System.out.println("두 번째 값: " + arr[1]);
		System.out.println("세 번째 값: " + arr[2]);
		System.out.println("네 번째 값: " + arr[3]);


	}
}
