package Day_12_StudentManager.src;
import java.util.ArrayList;

public class Manager {
	
	private ArrayList<Student> stds = new ArrayList<>();
	
	public void add(Student std) {
		this.stds.add(std);
	}
	
	public ArrayList<Student> getStds() {
		return this.stds;
	}
	
	public ArrayList<Student> searchByName(String name){
		ArrayList<Student> result = new ArrayList<>();
		for(Student std : stds) {
			if(std.getName().equals(name)) { // 검색하고자 하는 이름이 index학생의 이름과 같다면
				// 찾아낸 학생을 result 배열에 기록하는 코드
				result.add(std);
			}
		}
		return result;
	}
	
	public void deleteById(int id){
		for(Student std : stds) {
			if(std.getId() == id) {
				stds.remove(std);
				break;
			}
		}		
	}
	
	public void updateById(Student param) {
		for(Student std : stds) {
			if(std.getId() == param.getId()) {
				std.setKor(param.getKor());
				std.setEng(param.getEng());
				std.setMath(param.getMath());
				break;
			}
		}	
	}
	
	
}







