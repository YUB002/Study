package academy;

import java.util.Scanner;

public class Method_06 {
	public static int myRand(int num1, int num2) {
		if(num2>num1) {
			return (int)((Math.random()*num2-num1+1)+num1);
		}else {
			return (int)((Math.random()*num1-num2+1)+num2);
		}
	}
	//	public static int myRand(int min, int max) {
	//		return (int)((Math.random()*max-min+1)+min);}


	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		while(true) {
			System.out.println("==== 가위 바위 보 게임 ====");
			System.out.print("선택하세요 (1.가위 / 2.바위 / 3.보) : ");
			int player = Integer.parseInt(sc.nextLine());         // 플레이어의 선택
			int com = myRand(1,3);             // 컴퓨터의 선택

			System.out.println("======== 결과 ========");

			switch(player) {
			case 1:
				System.out.println("플레이어는 가위를 냈습니다.");
				break;
			case 2:
				System.out.println("플레이어는 바위를 냈습니다.");
				break;
			case 3:
				System.out.println("플레이어는  보 를 냈습니다.");
				break;
			}

			switch(com) {
			case 1:
				System.out.println("컴퓨터는 가위를 냈습니다.");
				break;
			case 2:
				System.out.println("컴퓨터는 바위를 냈습니다.");
				break;
			case 3:
				System.out.println("컴퓨터는  보 를 냈습니다.");
				break;
			}

			System.out.println("=====================");

			if(player == com) { // 비긴 경우
				System.out.println("비겼습니다!");
			}else if((player==1 && com == 3) || 
					(player==2 && com==1) ||
					(player==3 && com==2)) { // 플레이어가 승리한 경우
				System.out.println("플레이어가 승리했습니다!");
			}else { // 플레이어가 패배한 경우
				System.out.println("컴퓨터가 승리했습니다!");
			}
		}
	}
}