package exam;

import java.util.Scanner;

public class Student {
	 Scanner sc = new Scanner(System.in);

	   private String name;
	   private int kor;
	   private int eng;
	   // private int sum; *** 사용하지 않음
	   // private int avg; *** 사용하지 않음

	   // 생성자
	   public Student() {
	   } // default constructor overloading

	   public Student(String name, int kor, int eng) {
	      this.name = name;
	      this.kor = kor;
	      this.eng = eng;
	   }

	   // setters&getters
	   public String getName() {
	      return name;
	   }

	   public void setName(String name) {
	      this.name = name;
	   }

	   public int getKor() {
	      return kor;
	   }

	   public void setKor() {
	      while (true) {
	         int nu = Integer.parseInt(sc.nextLine());
	         // 수정 전 코드 if (0 <= kor && kor < 101) { *** 입력 받은값이 조건식에 들어가야함
	         if (0 <= nu && nu < 101) { // 수정 후 코드
	            this.kor = nu;
	            break;
	         } else {
	            System.out.println("다시 입력해주세요");
	         }
	      }
	   }

	   public int getEng() {
	      return eng;
	   }

	   public void setEng() {
	      while (true) {
	         int nu = Integer.parseInt(sc.nextLine());
	         // 수정 전 코드 if (0 <= kor && kor < 101) { *** 위와 동일
	         if (0 <= nu && nu < 101) { // 수정 후 코드
	            this.eng = nu;
	            break;
	         } else {
	            System.out.println("다시 입력해주세요");
	         }
	      }
	      // this.eng = eng; *** 필요없는 코드
	   }

	   public int getSum() {
	      return this.eng + this.kor;
	   }

	   public double getAvg() {
	      return this.getSum() / 2.0;
	      // 2.0이 아니라 2로 하면 int+int여서 이미 답에서 소수점은 삭제되고
	      // 삭제된 답이 더블로 반환되는 것이라 소용없음
	   }
}
