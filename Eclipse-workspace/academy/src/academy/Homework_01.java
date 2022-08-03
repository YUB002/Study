package academy;

import java.util.Scanner;

public class Homework_01 {
	public static void main(String[] args) {
		//1~n까지의 합 구하기 
		//합계를 누적시키며 더한다.
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("===== 1~n까지의 합 구하기 ==== ");
		System.out.print("n 입력: ");
		int num = Integer.parseInt(sc.nextLine());
		
		int sum = 0;
		int i=1;
		
		while(i<=num) {
			sum+=i; 
			i++;
		}
		System.out.println("1~"+num+"까지의 합은 " + sum+"입니다.");
		
	}
}
