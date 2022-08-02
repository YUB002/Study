package academy;

public class Exam_01 {
	public static void main(String[] args) throws Exception{
	//단일문자입력과 예외전가
		//System.in.read();
		 //단일문자
		 //값을 입력받아 메모리 속 변수에 저장
		 //int형으로 가져옴
		
		//Buffer
		 //버퍼에서 Enter 키 까지의 문자열을 입력 받음 \r=13  \n=10
		 //String 형으로 입력 받음

		
		System.out.println("한 글자를 입력하세요.");
		int input1 = System.in.read(); //사용자로부터 값을 입력받는 기능
		System.out.println("입력하신 문자는 " + input1 + "입니다.");
		
		System.out.println("한 글자를 입력하세요.");
		int input2 = System.in.read(); //입력한 값을 ASCII코드값으로 변수에 저장 
		System.out.println("입력하신 문자는 " + input2 + "입니다.");
		
		System.out.println("한 글자를 입력하세요.");
		int input3 = System.in.read();
		System.out.println("입력하신 문자는 " + input3 + "입니다.");
		
		System.out.println("한 글자를 입력하세요.");
		int input4 = System.in.read();
		System.out.println("입력하신 문자는 " + input4 + "입니다.");
		
		//두번째와 세번째는 enter 값
	}
}
