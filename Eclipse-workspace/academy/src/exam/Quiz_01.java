package exam;

import java.util.Scanner;

public class Quiz_01 {
	 public static void main(String[] args) {

	      //배열 10칸 짜리로 시작

	      //<<학생 관리 프로그램>>
	      //1. 신규 정보 입력
	      //2. 학생 목록 출력
	      //3. 프로그램 종료
	      // 선택>>

	      // 1번 선택 시
	      // 학생의 이름, 국어, 영어 점수를 입력받아 Student 인스턴스로 생성 후
	      // Student형 배열에 저장.

	      // 2번 선택 시
	      // 배열에 저장되어 있는 모든 학생 정보를 이름/국어/영어/합계/평균 순으로 모두 출략
	      // 배열에 한명의 정보도 저장되어 있지 않을 시, "출력한 내영이 없습니다."라고 안내.

	      Scanner sc = new Scanner(System.in);
	      Student[] stds = new Student[10];
	      int o=0;
	      int num = 0;
	      while(true) {
	         System.out.println("<<학생 관리 프로그램>>");
	         System.out.println("1. 신규 정보 입력");
	         System.out.println("2. 학생 목록 출력");
	         System.out.println("3. 프로그램 종료");
//	         try {
	            System.out.print("선택>>");
	            
	            while (true) {
	               try { // *** try catch는 필요한 곳에만 국소적으로 쓰는게 좋아요 다른 에러도 예외 처리돼서 잡아내기 힘들어지기 때문
	                  num = Integer.parseInt(sc.nextLine());
	                  break;
	               } catch (Exception e) {
	                  System.out.println("숫자를 눌러주세요");
	               }
	            }
	            switch(num) {
	            case 1:
	               if(o<stds.length){
	               System.out.println("<<신규 정보 입력>>");
	               System.out.print("학생 이름 >>");
	               stds[o] = new Student();
	               stds[o].setName(sc.nextLine());
	               System.out.print("국어 점수 >>");
	               stds[o].setKor();
	               System.out.print("영어 점수 >>");
	               stds[o].setEng();
//	               stds[o] = new Student(name,kort,engt);
//	               System.out.print("국어 점수 >>");
//	               setKor()
	               
	               
	               
	               

	               o++;
	               } else {
	               System.out.println("입력한 학생이 가득찼습니다.");
	               }
	               break;
	            case 2:
	               // 수정 전 코드 if(o<stds.length) { *** stds.length는 10으로 초기화됐고 o는 0부터 시작이라 항상 true가 됨
	               // *** o가 0일때는 Student 인스턴스가 생성되기 전이므로 출력할 내용이 없음
	               if(o == 0) { // 수정 후 코드
	                  System.out.println("출력할 내용이 없습니다.");
	                  break;
	               }
	               System.out.println("<<학생 목록 출력>>");
	               System.out.println("이름\t국어\t영어\t합계\t평균");
	               // 수정 전 코드 for(int i=0;i<stds.length;i++) { *** stds.length가 10이어서 항상 10번 반복하게 되는데
	               // 입력을 10번 하기전에 출력하면 i값이 stds 배열의 인덱스를 초과하므로 NullPointerException 발생
	               for (int i=0;i<o;i++) { // 수정 후 코드
	                  System.out.println(stds[i].getName()+"\t"+
	                        stds[i].getKor()+"\t"+
	                        stds[i].getEng()+"\t"+
	                        stds[i].getSum()+"\t"+
	                        stds[i].getAvg());
	               }
	               break;
	            case 3:
	               System.out.println("프로그램을 종료합니다.");
	               System.exit(0);
	            default: 
	               System.out.println("메뉴를 눌러주세요");
	            }
//	         }
//	         catch(Exception e) {
//	            System.out.println("숫자를 눌러주세요");
//	         }
	      }
	   }
}
