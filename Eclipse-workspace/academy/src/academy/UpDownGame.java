package academy;

import java.util.Scanner;

public class UpDownGame {
public static void main(String[] args) {
		
		//up&down 게임
		//1~99까지의 랜덤한 숫자
		//전체 메뉴는 switch와 case문으로 만들 것
		Scanner sc = new Scanner(System.in);
		
		int result = 99;
		int game = 0;
		
		while(true) {
			int ran = (int)(Math.random()*99+1);
		int sco = 0;
			
		System.out.println(" == UP & DOWN Game ===");
		
		System.out.println("1. Game Start");
		System.out.println("2. Game Score");
		System.out.println("3. End Score");
		System.out.print(">");
		int num = Integer.parseInt(sc.nextLine());
		
		
		switch(num) {
		case 1: 
			game++;
			System.out.println("Game Start!");
			
			while(true) {
			System.out.print("Input Number : ");
			int guess = Integer.parseInt(sc.nextLine());
				if(guess < ran) {
					System.out.println("<<UP!>>");
					sco++;
				}else if(guess == ran) {
					System.out.println("<<정답!>>");
					sco++;
					if(result > sco) {
						result = sco;
					}break;
				}else {
					System.out.println("<<DOWN!>>");
					sco++;
				}
			}
			break;
		
		case 2:
			if (game==0) {
				System.out.println("<<현재 기록이 없습니다.>>");
			} else if (game >0) {
			System.out.println("<<현재까지의 최단 기록은 " +result+"입니다.>>");}
			break;
		
		case 3:
			System.out.println("<<게임을 종료합니다.>>");
			System.exit(0);
		
		default:
			System.out.println("<<다시 입력해주세요.>>");
	
		}
		
	}

}
}
