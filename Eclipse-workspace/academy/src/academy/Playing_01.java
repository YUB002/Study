package academy;

import java.awt.Robot;

public class Playing_01 {
	public static void main(String[] args) throws Exception{
		//마우스를 오른쪽으로 이동하게끔

		Robot r = new Robot(); 
		r.mouseMove(500, 500); //마우스 초기 위치 세팅


		for(int i=0;i<500;i++) {
			r.mouseMove(500+i, 500);
//			r.delay(10); //(1000)=1초
		}

	}
}
