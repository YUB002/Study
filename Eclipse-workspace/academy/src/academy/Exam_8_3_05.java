package academy;

public class Exam_8_3_05 {
	public static void main(String[] args) {
	
		//1~100사이의 숫자가 5의 배수일 때 짝이 나오게 출력

		int i =0 ;
		
		while(i<100) {
			i++;
			if(i%5 == 0) {
			System.out.println("짝");
			} else {
			System.out.println(i);
			}
			
		}
		
		
	}
}
