package academy;

public class Array_06 {
	public static void main(String[] args) {


		//난수 1~5 사이의 3개를 출력	
		System.out.println((int)(Math.random()*5+1));		
		System.out.println((int)(Math.random()*5+1));		
		System.out.println((int)(Math.random()*5+1));


		// swap 기법 카드섞기 알고리즘
		int[] cards = new int [] {1,2,3,4,5};

		for(int i=0;i<cards.length*10;i++) {
			int x = (int)(Math.random()*5);
			int y = (int)(Math.random()*5);

			int tmp = cards[x];
			cards[x] = cards[y];
			cards[y] = tmp;

		}

		System.out.println(cards[0]+":"+cards[1]+":"+cards[2]);
	}
}
