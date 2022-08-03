package academy;

public class Exam_8_3_04 {
	public static void main(String[] args) {
		//50~100사이의 홀수만 출력

		int i = 51;
		while(i<100) {
			if(i % 2 == 1) {
				System.out.println(i);
			}
			i++;
		}
	}
}
