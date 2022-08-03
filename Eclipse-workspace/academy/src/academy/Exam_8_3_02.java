package academy;

import java.util.Scanner;

public class Exam_8_3_02 {
	public static void main(String[] args) {
		//사용자가 선택한 구구단 출력
		//변수를 적절히 사용하여 두 수의 곱을 출력
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("=== 구구단 출력 프로그램 ===");
		System.out.print("1~9단 중 선택: ");
		int num = Integer.parseInt(sc.nextLine());
		
		int i = 1;
		
		while (i<10) {
			if(0<num && num <10) {
				System.out.println(num + "*" + i + "=" + (num*i));
				i++;
			}else {
				System.out.println("1~9단에서 선택해주세요.");
				i = i+10;
			}
			
		}
		
		
	}
}
