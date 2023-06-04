package Notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.*;

public class bbs_DAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public bbs_DAO() {
        try {

            String dbURL = "jdbc:mysql://43.201.115.70/ggulnong?autoReconnect=true&amp&serverTimezone=UTC";
            String dbID = "spring";
            String dbPassword = "daelimspring";

            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    public String getDate() {
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }

        return ""; // db오류
    }

    public int getNext() {
        String SQL = "SELECT bbsID FROM ggulnong.Notice_Practice ORDER BY bbsID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt(1) +1;
            }
            return 1; //현재 게시물이 첫번째인 경우
        } catch(Exception e) {
            e.printStackTrace();
        }

        return -1; // db오류
    }

    public int write(String bbsTitle, String userID, String bbsContent) {
        String SQL = "INSERT INTO ggulnong.Notice_Practice VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, bbsTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, bbsContent);
            pstmt.setInt(6, 1);
            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1; // db오류
    }
    public ArrayList<bbs> getList(int pageNumber){

        String SQL = "SELECT * FROM ggulnong.Notice_Practice WHERE bbsID < ?  AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";

        ArrayList<bbs> list = new ArrayList<bbs>();

        try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                bbs bbs = new bbs();

                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                list.add(bbs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }
    public boolean nextPage (int pageNumber) {

        String SQL = "SELECT * FROM ggulnong.Notice_Practice WHERE bbsID < ? AND bbsAvailable = 1";

        try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public bbs getBbs(int bbsID) {

        String SQL = "SELECT * FROM ggulnong.Notice_Practice WHERE bbsID = ?";

        try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);

            rs = pstmt.executeQuery();

            if (rs.next()) {

                bbs bbs = new bbs();

                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));

                return bbs;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public int update(int bbsID, String bbsTitle, String bbsContent) {

        String SQL = "UPDATE ggulnong.Notice_Practice SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, bbsTitle);
            pstmt.setString(2, bbsContent);
            pstmt.setInt(3, bbsID);
            return pstmt.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return -1; // db오류
    }
    public int delete(int bbsID) {

        String SQL = "UPDATE ggulnong.Notice_Practice SET bbsAvailable = 0 WHERE bbsID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);
            return pstmt.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return -1; // db오류
    }


}

