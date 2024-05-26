package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class fileDAO {	
	private Connection conn;
	
	public fileDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/file"; //file라는 데이터베이스에 접근하게 해줌
			String dbID = "root";
			String dbPassword = "twins0030!";
			Class.forName("com.mysql.jdbc.Driver"); //MYSQL에 접속 할 수 있도록 해주는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn 객체안에 접속된 정보들이 담김
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName ,String fileRealName) {
		String SQL = "INSERT INTO file VALUES (?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);

			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
		
	}
	
}
