package academy;

import java.util.Scanner;

public class Quiz_01 {
	public static void main(String[] args) {
//처음 프로그램이 실행되면
//출력: <<방문록>>
//출력: 이름과 연락처를 작성해주세요.
//이름: <<입력>>
//연락처: <<입력>>
//출력: =======
//출력: 저는 (입력받은 이름)입니다.
//출력: (입력받은 연락처)로 전화주세요.
		Scanner sc = new Scanner(System.in);
		
		System.out.println(" <<방문록>>");
		System.out.println("이름과 연락처를 작성해주세요");
		System.out.print("이름: ");
		String name = sc.nextLine();
		
		System.out.print("연락처: ");
		String Pnumber = sc.nextLine(); 

		System.out.println("============");
		System.out.println("저는 " + name + "입니다.");
		System.out.println(Pnumber + "로 전화주세요.");
		
		
		
		
		
	}
}
