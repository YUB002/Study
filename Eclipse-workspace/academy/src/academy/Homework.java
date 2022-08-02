package academy;

import java.util.Scanner;

public class Homework {
	public static void main(String[] args) {
Scanner sc = new Scanner(System.in);

		

		System.out.println("가을을 맞이하여 책장 정리를 하는데 책상 위에 필름이 하나 있습니다. 당신은 그 필름을 인화해 보았습니다. 인화된 사진에는 어떤 것이 찍혀 있을까요?");

		System.out.println("1. 어린이 사진");

		System.out.println("2. 도시의 야경");

		System.out.println("3. 산 풍경");

		System.out.println("4. 동물");

		

		System.out.print("당신의 선택은? ");

		int num = Integer.parseInt(sc.nextLine());

		

		System.out.println("======= 결 과 ======");

		

		if(0 < num && num < 5) {

			if (num == 1) {

				System.out.println("1번을 뽑은 당신! 눈물과 인정에 약한 타입입니다.");

			} else if (num == 2) {

				System.out.println("2번을 뽑은 당신! 인간관계가 중요한 타입입니다.");

			}else if (num == 3) {

				System.out.println("3번을 뽑은 당신! 약간의 마음의 짐만 있어도 불안해하는 타입입니다.");

			}else if (num == 4) {

				System.out.println("4번을 뽑은 당신! 자신보다 남을 생각할 줄 아는 타입입니다.");

			}

		} else {

			System.out.println("잘못 입력하셨습니다.");

		}

		

		

	}
}

