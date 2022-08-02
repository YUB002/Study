package academy;

import java.util.Scanner;

public class Quiz_02 {
	public static void main(String[] args) {
//두 정수를 입력받아
//덧셈한 결과를 출력하는 프로그램을 작성하세요.
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("덧셈 프로그램");
		
		System.out.print("첫번째 숫자: ");
		int num1 = Integer.parseInt(sc.nextLine());
		
		System.out.print("두번째 숫자: ");
		int num2 = Integer.parseInt(sc.nextLine());
		
		System.out.println("두 수의 합은: " + (num1 + num2) );

		
		
}
}
