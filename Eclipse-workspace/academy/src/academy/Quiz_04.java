package academy;

import java.util.Scanner;

public class Quiz_04 {
	public static void main(String[] args) {
	//두 숫자를 입력받아 대소를 비교하세요. (입력받은 숫자가 같을 경우도 처리)
	
	Scanner sc = new Scanner(System.in);
	
	System.out.print("첫번째 숫자 입력: ");
	int num1 = Integer.parseInt(sc.nextLine());
	
	System.out.print("두번째 숫자 입력: ");
	int num2 = Integer.parseInt(sc.nextLine());
	
	System.out.println("==========");
	
	if(num1 > num2) {
		System.out.println("첫번째 숫자가 더 크다.");
	} else if(num1 < num2) {
		System.out.println("두번째 숫자가 더 크다.");
	} else {
		System.out.println("두 수의 값이 같다.");
	}
	
		
		
}
}
