package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn; //데이터 베이스에 접근하게 해주는 하나의 객체
	private PreparedStatement pstmt; // 물음표로 받을수 있는 것
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS"; //BBS라는 데이터베이스에 접근하게 해줌
			String dbID = "root";
			String dbPassword = "twins0030!";
			Class.forName("com.mysql.jdbc.Driver"); //MYSQL에 접속 할 수 있도록 해주는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn 객체안에 접속된 정보들이 담김
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//------------------- 여기까지가 mysql 접속하는 부분 -------------
	
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); //정해진 sql 문장을 데이터베이스에 삽입하는 형식으로 pstmt 인스턴스를 가져온다
			pstmt.setString(1, userID); // 위에 물음표에 값을 userID로 넣겠다는 뜻이다 
			rs = pstmt.executeQuery(); //결과 객체 rs 에 실행한 결과를 담아준다 
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}

