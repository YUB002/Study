package academy;

import java.util.Scanner;

public class Method_05 {
	public static int validNum(String msg) {
		Scanner sc= new Scanner(System.in);
		while(true) {
			try{
				System.out.print(msg);
				int num = Integer.parseInt(sc.nextLine());
				return num;
			}catch(Exception e) {
				System.out.println("숫자를 입력하세요.");
			}
		}
	}

	public static void main(String[] args) {
		Scanner sc= new Scanner(System.in);

		while(true) {
			System.out.println("=== 계산기 프로그램 ===");

			System.out.print("연산자 입력 (+,-,*,/,q[종료]) : ");
			String oper = sc.nextLine();

			if(oper.equals("q")) { // q를 눌렀을 경우
				System.out.println("계산기를 종료합니다.");
				System.exit(0);
			}else if(oper.equals("+") || oper.equals("-") || 
					oper.equals("*") || oper.equals("/")) {
				// 입력한 값이 + 이거나 - 이거나 * 이거나 / 인 경우

				int num1 = validNum("첫번째 수: ");
				int num2 = validNum("두번째 수: ");

				System.out.println("=== 결 과 ===");

				if(oper.equals("+")) {
					System.out.println(num1 + " + " + num2 + " = " + (num1+num2));
				}else if(oper.equals("-")) {
					System.out.println(num1 + " - " + num2 + " = " + (num1-num2));
				}else if(oper.equals("*")) {
					System.out.println(num1 + " * " + num2 + " = " + (num1*num2));
				}else if(oper.equals("/")) {
					System.out.println(num1 + " / " + num2 + " = " + ((double)num1/num2));
				}
			}else {
				System.out.println("연산자를 다시 확인해주세요.");
			}
		}
	}
}