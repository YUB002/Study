import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CafeMenuDAO {

	private Connection getConnection() throws Exception{
		String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		String ID = "kh";
		String PW = "kh";

		Connection con = DriverManager.getConnection(URL,ID,PW);
		return con;
	}//코드가 반복되어 메서드로 만들고 DAO에서만 사용하므로 private 메서드

	public int insert(CafeMenuDTO dto) throws Exception{
		String sql = 
				"insert into cafe_menu values(cafe_menu_seq.nextval,?,?,?)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat =con.prepareStatement(sql);){
			pstat.setString(1, dto.getPname());
			pstat.setInt(2,dto.getPprice());
			pstat.setString(3, dto.getIced());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}	

	public int update(CafeMenuDTO dto) throws Exception{	

		String sql = 
				"update cafe_menu set pname=?,pprice=?,iced=? where pid=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat =con.prepareStatement(sql);){
			pstat.setString(1, dto.getPname());
			pstat.setInt(2, dto.getPprice());
			pstat.setString(3, dto.getIced());
			pstat.setInt(4, dto.getPid());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public ArrayList<CafeMenuDTO> selectAll() throws Exception {
		String sql = "select * from cafe_menu order by 1";

		try(Connection con = this.getConnection();
				PreparedStatement pstat =con.prepareStatement(sql);){
			ResultSet rs =pstat.executeQuery();

			ArrayList<CafeMenuDTO> result = new ArrayList<>();

			while(rs.next()) {
				int pid=rs.getInt("pid");
				String pname = rs.getString("pname");
				int pprice=rs.getInt("pprice");
				String iced = rs.getString("iced");

				CafeMenuDTO dto = new CafeMenuDTO(pid,pname,pprice,iced);
				result.add(dto);
			}
			return result;
		}
	}
	public int delete(int delid) throws Exception{
		String sql = "delete from cafe_menu where pid = ?";
		Connection con = getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, delid);
		int result = pstat.executeUpdate();
		con.commit();
		con.close();
		return result;
	}
}

