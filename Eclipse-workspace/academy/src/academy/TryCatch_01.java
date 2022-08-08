package academy;

import java.util.Scanner;

public class TryCatch_01 {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int num = 0;

		while(true) {
			System.out.print("숫자 입력: ");
			try {
				num = Integer.parseInt(sc.nextLine());
				System.out.println("정상 입력되었습니다.");
				break;
			}catch(Exception e) {
				System.out.println("숫자를 입력해야 합니다.");
			}
		}

		System.out.println("프로그램 종료" + num);


	}
}
