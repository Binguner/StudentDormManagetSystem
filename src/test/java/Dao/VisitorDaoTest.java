package Dao;

import Bean.VisitorBean;
import JDBCUtils.JDBCUtils;
import org.junit.Before;
import org.junit.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class VisitorDaoTest {

    private Connection connection;

    @Test
    @Before
    public void getConnection(){
        connection = JDBCUtils.getConnection();
    }

    @Test
    public void getAllVisitor() {
        List<VisitorBean> list=new ArrayList<>();
        try{
            String sql="select * from VisitorTable";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next())
            {
                VisitorBean visitor=new VisitorBean();
                visitor.setId(resultSet.getInt(1));
                visitor.setBuildNumber(resultSet.getInt(2));
                visitor.setVisitorName(resultSet.getString(3));
                visitor.setVisitorDate(resultSet.getString(4));
                visitor.setPhone(resultSet.getString(5));
                visitor.setReason(resultSet.getString(6));
                list.add(visitor);

            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        printList(list);
    }

    @Test
    public void getVisitorByBuildId() {
        int buildNumber = 1;
        List<VisitorBean> list=new ArrayList<>();
        String sql="select * from VisitorTable where buildNumber=(?)";
        try{
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setInt(1, buildNumber);
            ResultSet resultSet=statement.executeQuery();
            while(resultSet.next()) {
                VisitorBean visitor=new VisitorBean();
                visitor.setId(resultSet.getInt(1));
                visitor.setBuildNumber(resultSet.getInt(2));
                visitor.setVisitorName(resultSet.getString(3));
                visitor.setVisitorDate(resultSet.getString(4));
                visitor.setPhone(resultSet.getString(5));
                visitor.setReason(resultSet.getString(6));
                list.add(visitor);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        printList(list);
    }

    @Test
    public void getVisitorByDate() {
        String date = "2014-04-05";
        List<VisitorBean> list=new ArrayList<>();
        String sql="select * from VisitorTable where visitorDate=(?)";
        try{
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setString(1, date);
            ResultSet resultSet=statement.executeQuery();
            while(resultSet.next()) {
                VisitorBean visitor=new VisitorBean();
                visitor.setId(resultSet.getInt(1));
                visitor.setBuildNumber(resultSet.getInt(2));
                visitor.setVisitorName(resultSet.getString(3));
                visitor.setVisitorDate(resultSet.getString(4));
                visitor.setPhone(resultSet.getString(5));
                visitor.setReason(resultSet.getString(6));
                list.add(visitor);
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        printList(list);
    }

    @Test
    public void getVisitorByBuildIdAndDate() {
        //int buildNumber = 1;
        int buildNumber = 3;
        String date = "2012-02-03";
        //String date = "2014-04-05";
        String sql="select * from VisitorTable where buildNumber=(?) and visitorDate=(?)";
        List<VisitorBean> list=new ArrayList<>();
        try{
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setInt(1, buildNumber);
            statement.setString(2,date);
            ResultSet resultSet=statement.executeQuery();
            while(resultSet.next()) {
                VisitorBean visitor=new VisitorBean();
                visitor.setId(resultSet.getInt(1));
                visitor.setBuildNumber(resultSet.getInt(2));
                visitor.setVisitorName(resultSet.getString(3));
                visitor.setVisitorDate(resultSet.getString(4));
                visitor.setPhone(resultSet.getString(5));
                visitor.setReason(resultSet.getString(6));
                list.add(visitor);
            }
        }catch(SQLException e) {
            e.printStackTrace();
            System.out.println("wrong");
        }
        printList(list);
    }

    @Test
    public void addVistor() {
        int buildNumber = 1;
        String visitorName = "Test";
        String visitorDate = "2014-4-5";
        String phone = "123456";
        String reason = "rer";
        String sql="insert into VisitorTable(buildNumber,visitorName,visitorDate,phone,reason) values(?,?,?,?,?)";
        try{
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setInt(1,buildNumber);
            statement.setString(2,visitorName);
            statement.setString(3,visitorDate);
            statement.setString(4,phone);
            statement.setString(5, reason);
            statement.execute();
        }catch(SQLException e){
            e.printStackTrace();
        }

    }

    private void printList(List<VisitorBean> list){
        list.forEach(visitorBean -> {
            System.out.println(
                    visitorBean.getId() + " "
                    + visitorBean.getBuildNumber() + " "
                    + visitorBean.getVisitorName() + " "
                    + visitorBean.getVisitorDate() + " "
                    + visitorBean.getPhone() + " "
                    + visitorBean.getReason()
            );
        });
    }
}