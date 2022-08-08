package academy;

import java.util.Scanner;

public class TryCatch_02 {
	public static void main(String[] args) {

		Scanner sc =new Scanner(System.in);
		int num1 = 0;
		int num2 = 0;

		while(true) {
			System.out.println("=== 계산기 프로그램 === ");
			System.out.print("연산자 입력 (+,-,*,/,q[종료]) : ");
			String pl = sc.nextLine();
			if(pl.equals("+")||pl.equals("-")||pl.equals("*")||pl.equals("/")) {

				while(true) {
					try {
						System.out.print("첫 번째 숫자 입력 : ");
						num1 = Integer.parseInt(sc.nextLine());
						break;
					}catch(Exception e) {
						System.out.println("숫자를 입력해야 합니다.");
					}
				}

				while(true) {
					try {
						System.out.print("두 번째 숫자 입력 : ");
						num2 = Integer.parseInt(sc.nextLine());
						break;
					}catch(Exception e) {
						System.out.println("숫자를 입력해야 합니다.");
					}
				}




				if(pl.equals("+")) {
					System.out.println("=== 결과 === ");
					System.out.println(num1+ " + " + num2 +" = "+ (num1+num2));
				}else if(pl.equals("-")) {
					System.out.println(" === 결과 === ");
					System.out.println(num1+ " - " + num2 +" = "+ (num1-num2));
				}else if(pl.equals("*")) {
					System.out.println(" === 결과 === ");
					System.out.println(num1+ " * " + num2 +" = "+ (num1*num2));
				}else if(pl.equals("/")) {
					System.out.println(" === 결과 === ");
					System.out.println(num1+ " / " + num2 +" = "+ (num1/num2));
				}
			} else if(pl.equals("q")) {
				System.out.println("계산기 프로그램을 종료합니다. ");
				System.exit(0);
			} else {
				System.out.println("*오류* \n해당 연산자를 입력해주세요. ");
				continue;
			}



		}
	}
}
