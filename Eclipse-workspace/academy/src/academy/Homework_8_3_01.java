package academy;

import java.util.Scanner;

public class Homework_8_3_01 {
	public static void main(String[] args) {

		//자판기 시뮬레이터

		Scanner sc = new Scanner(System.in);

		int money = 3000;

		int k = 0;

		int s = 0;

		int m = 0;

		

		while(true){

		System.out.println("=== 자판기 시뮬레이터 ===");

		System.out.println("음료수를 선택하세요.");

		System.out.println("1. 콜라 (1000)");

		System.out.println("2. 사이다 (800)");

		System.out.println("3. 매실차 (1500)");

		System.out.println("[0. 소지품확인]");

		System.out.println("[9. 나가기]");

		System.out.print(">>");

		int choice = Integer.parseInt(sc.nextLine());

		



		if(choice == 1) {

			if(money < 1000) {

				System.out.println("잔액이 부족합니다.");

				continue;

			}

			System.out.println("콜라를 구매했습니다. \n콜라 +1 \n소지금 -1000");

			money = money -1000;

			k = k+1;

		}

		else if(choice == 2) {

			if(money < 800) {

				System.out.println("잔액이 부족합니다.");

				continue;

			}

			System.out.println("사이다를 구매했습니다. \n사이다 +1 \n소지금 -800");

			money = money -800;

			s = s+1;

		}

		else if(choice == 3) {

			if(money < 1500) {

				System.out.println("잔액이 부족합니다.");

				continue;

			}

			System.out.println("매실차를 구매했습니다. \n매실차 +1 \n소지금 -1500");

			money = money -1500;

			m = m+1;

		}

		else if(choice == 0) {

			System.out.println("====소지품 목록====");

			System.out.println("소지금 : " + money);

			System.out.println("콜라 : "+k );

			System.out.println("사이다 : " +s);

			System.out.println("매실차 : " +m);

			System.out.println("===============");

		}

		else if(choice == 9) {

			System.out.println("자판기 시뮬레이터를 종료합니다.");

			break;

		}

		else {

			System.out.println("*오류* \n다시 입력하세요.");

		}

		

		

		}

	}
}
