package academy;



public class Method_01 {

	//2개의 정수를 인자값으로 받아 뺄셈한 결과를 반환하는 minus 메서드를 작성해보세요.
		public static int minus(int num1, int num2) {
			return num1 - num2;
		}

		//2개의 정수를 인자값으로 받아 곱셈한 결과를 반환하는 mply 메서드를 작성해보세요.
		public static int mply(int num1, int num2) {
			return num1 * num2;
		}
		//2개의 정수를 인자값으로 받아 나눗셈한 결과를 double형으로 반환하는 divide 메서드를 작성해보세요.

		public static double divide(int num1, int num2) {
			return num1/(double)num2;
		}

		//2개의 정수를 인자값으로 받아 둘 중 더 큰수를 반환하는 bigger메서드를 작성해보세요
		//(만약 두 수가 같은 경우 0을 반환)
		public static int bigger(int num1, int num2) {
			if(num1>num2) {return num1;}
			else if(num2>num1) {return num2;}
			else {return 0;}
		}

		//"사과"라고 전달하면 "Apple"을 반환하고,"포도"라고 전달하면 "Grape"를 반환하는
		//traslate 메소드를 작성하세요
		//(기타 다른 단어가 전달되면 "None"을 반환하세요)

		public static String translate(String a) {
			if (a.equals("사과")) {
				return "Apple";
			} else if(a.equals("포도")) {
				return "Grape";
			} else {
				return "None";
			}
		}

	
	
}
