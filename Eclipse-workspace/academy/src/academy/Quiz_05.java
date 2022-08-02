package academy;

import java.util.Scanner;

public class Quiz_05 {
	public static void main(String[] args) {
		//1~100 사이를 입력받아 짝/홀수를 판단하세요.(1~100 사이의 수가 아닐 경우 예외 처리 후 종료)
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("짝홀수 판별기");
		
		System.out.print("숫자 입력: ");
		int num = Integer.parseInt(sc.nextLine());
		
		System.out.println("=======");
		
		if (0 < num && num <101 ) {
			if( num % 2 == 0 ) {
				System.out.println("입력한 숫자는 짝수입니다.");
			}else {
				System.out.println("입력한 숫자는 홀수입니다.");
			}
		} else {
			System.out.println("다시 입력해주세요.");
		}
		
		
		
		
		
		
	}
}
