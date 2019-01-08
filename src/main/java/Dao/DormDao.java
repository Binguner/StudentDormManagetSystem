package Dao;

import Bean.DormBean;
import JDBCUtils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DormDao {

    private static Connection connection;

    public DormDao(){
        connection = JDBCUtils.getConnection();
    }

    public static List<DormBean> getDormList(){
        String sql = "select * from DormTable";
        List<DormBean> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                DormBean dormBean = new DormBean();
                dormBean.setBuildNumber(resultSet.getInt(2));
                dormBean.setFloorNumber(resultSet.getInt(3));
                dormBean.setDormNumber(resultSet.getInt(4));
                dormBean.setPeopleCount(resultSet.getInt(5));
                list.add(dormBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


}
