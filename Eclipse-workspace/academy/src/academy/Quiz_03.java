package academy;

import java.util.Scanner;

public class Quiz_03 {
	public static void main(String[] args) {
		
		//학생의 성적(국영수)을 입력한 뒤 합계와 평균을 구해보시오.(정수형 변수 3개만 사용하여 코드작성)
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("=========");
		
		System.out.print("이름: ");
		String name = sc.nextLine();
		
		System.out.println("=========");
		
		System.out.print("국어: ");
		int kor = Integer.parseInt(sc.nextLine());
		
		System.out.print("영어: ");
		int eng = Integer.parseInt(sc.nextLine());
		
		System.out.print("수학: ");
		int math = Integer.parseInt(sc.nextLine());
		
		System.out.println("=========");
		
		System.out.println("합계: " + (kor + eng + math));
		
		
		System.out.println("평균: " + (double)(kor+eng+math)/3);
		//("평균: " + (kor+eng+math)/3.0);
		
		
		
		
	}
}
