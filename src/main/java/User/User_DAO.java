package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User_DAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public User_DAO() {
        try {

            String dbURL = "jdbc:mysql://127.0.0.1:3306/ggulnong?autoReconnect=true&amp&serverTimezone=UTC";
            String dbID = "root";
            String dbPassword = "tkyeom1478@";

            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    public int login(String userID, String userPassword) {

        String SQL = "SELECT userPassword FROM ggulnong.User_Practice WHERE userID = ?";

        try {

            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {

                if (rs.getString(1).equals(userPassword)) {
                    return 1; //로그인 성공
                } else

                    return 0; // 비밀번호 불일치

            }

            return -1; // 아이디가 존재 하지 않음



        } catch (Exception e) {

            e.printStackTrace();

        }

        return -2; // 데이터베이스 오류

    }
    public int join(User User) {
        String SQL = "INSERT INTO ggulnong.User_Practice VALUES (?, ?, ?, ?, ?)";
        try {

            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, User.getUserID());
            pstmt.setString(2, User.getUserPassword());
            pstmt.setString(3, User.getUserName());
            pstmt.setString(4, User.getUserGender());
            pstmt.setString(5, User.getUserEmail());
            return pstmt.executeUpdate();

        }    catch(Exception e) {
            e.printStackTrace();
        }

        return -1;
    }


}