package academy;

import java.util.Scanner;

public class Test_01 {
		
	
		 public static void main(String[] args) {
		      
		      Scanner sc = new Scanner(System.in);
		      int money = 0; 
		      
		      while(true) {
		      
		      System.out.println("<<< 경마게임에 오신 것을 환영합니다. >>>");
		      System.out.println("1. 게임시작");
		      System.out.println("2. 잔액충전");
		      System.out.println("3. 잔액조회");
		      System.out.println("4. 게임종료");
		      System.out.println("메뉴를 선택해주세요.");
		      System.out.print(">>");
		      int num = Integer.parseInt(sc.nextLine());
		      
		      
		      
		      switch(num) {
		      case 1:
		         int win = (int)(Math.random()*3+1);
		         
		         System.out.println("게임을 시작합니다.");
		         System.out.println("1. 우승경력이 많지만 은퇴를 앞둔 말");
		         System.out.println("2. 이번달 성적이 제일 좋은 말");
		         System.out.println("3. 최근 떠오르는 신예인 말");
		         
		         while(true) {
		         
		         System.out.print("배팅하고 싶은 말을 선택해주세요 >> ");
		         int horse = Integer.parseInt(sc.nextLine());
		         
		         if(horse !=1 && horse !=2 && horse !=3) {
		            System.out.println("선택하신 번호는 없는 번호입니다. \n다시 선택해주세요.");
		            continue;
		         }
		         
		         System.out.print("얼마를 배팅 하시겠습니까? ");
		         int lotto = Integer.parseInt(sc.nextLine());
		         
		            if(lotto > money || lotto == 0) {
		               System.out.println("잔액이 부족합니다.");
		               break;

		            }
		         
		            System.out.println("=== 결과 ===");
		            
		            if(horse == win) {
		               System.out.println(win+"번 말이 우승하였습니다. \n배팅에 성공하였습니다..!");
		               System.out.println("배팅한 금액의 2배인 " + lotto*2 + "원을 획득하셨습니다.");
		               money = (money-lotto) + lotto*2;
		               break;
		            } else {
		               System.out.println(win+"번 말이 우승하였습니다. \n배팅에 실패하였습니다...^^");
		               System.out.println("배팅한 금액인 "+ lotto + "원을 모두 잃으셨습니다.");
		               money = money-lotto;
		               break;
		            }}
		          break;
		      case 2:
		         System.out.println("얼마를 충전하시겠습니까? ");
		         int charge = Integer.parseInt(sc.nextLine());
		         money+= charge;
		         System.out.println("현재 잔액은 : " + money + "입니다.");
		         
		         break;
		         
		      case 3:
		         
		         System.out.println("현재 잔액은 : " + money + "입니다.");
		         
		         break;
		         
		      case 4: 
		         System.out.println("게임을 종료합니다.");
		         System.exit(0);
		         
		      default:
		            System.out.println("선택하신 번호는 없는 번호입니다. \n메뉴를 다시 선택해주세요.");

		      }
		    }

	
	
	
	
		 }}
