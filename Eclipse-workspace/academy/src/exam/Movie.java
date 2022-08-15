package exam;

import java.util.Scanner;

public class Movie {
 Scanner sc = new Scanner(System.in);
	private String name;
	private String genre;
	private int rating;

	public Movie(){}
	public Movie(String name, String genre, int rating) {
		this.name = name;
		this.genre = genre;
		this.rating = rating;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getRating() {
		return rating;
	}

	public void setRating() {
		while(true) {
			int i=Integer.parseInt(sc.nextLine());
			if(0<=i && i<101) {
				this.rating = i;
				break;
			}else {
				System.out.println("최소 점수는 0점이며 최고 점수는 100점입니다.\n다시 입력해주세요");
			}
		}
	} 
}
