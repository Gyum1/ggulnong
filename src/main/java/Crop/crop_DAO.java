package Crop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class crop_DAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    public crop_DAO() {
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

    public int getNext() {
        String SQL = "SELECT nID, vName FROM ggulnong.Crop_Info ORDER BY nID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1; //현재 게시물이 첫번째인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1; // db오류
    }

    public ArrayList<crop> getList(int pageNumber){

        String SQL = "SELECT * FROM ggulnong.Crop_Info WHERE nID < ? ORDER BY nID DESC LIMIT 10";

        ArrayList<crop> list = new ArrayList<crop>();

        try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                crop crop = new crop();

                crop.setnId(rs.getString(1));
                crop.setvName(rs.getString(2));
                crop.setvGrowing_Condition(rs.getString(3));
                crop.setvCultivation_Schedule(rs.getString(4));
                crop.setvVariety_Selection(rs.getString(5));
                crop.setvGrow_Method(rs.getString(6));
                crop.setVMalnutrition(rs.getString(7));
                crop.setvHarvest(rs.getString(8));
                crop.setvNutritional_Value(rs.getString(9));
                crop.setvManagement_Method(rs.getString(10));
                crop.setvGrowing_Tip(rs.getString(11));
                list.add(crop);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public crop getCrop(int nID) {

        String SQL = "SELECT * FROM ggulnong.Crop_Info WHERE nID = ?";

        try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, nID);

            rs = pstmt.executeQuery();

            if (rs.next()) {

                crop crop = new crop();


                crop.setnId(rs.getString(1));
                crop.setvName(rs.getString(2));
                crop.setvGrowing_Condition(rs.getString(3));
                crop.setvCultivation_Schedule(rs.getString(4));
                crop.setvVariety_Selection(rs.getString(5));
                crop.setvGrow_Method(rs.getString(6));
                crop.setVMalnutrition(rs.getString(7));
                crop.setvHarvest(rs.getString(8));
                crop.setvNutritional_Value(rs.getString(9));
                crop.setvManagement_Method(rs.getString(10));
                crop.setvGrowing_Tip(rs.getString(11));

                return crop;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }



}
