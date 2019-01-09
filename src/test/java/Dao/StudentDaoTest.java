package Dao;

import Bean.StudentBean;
import JDBCUtils.JDBCUtils;
import org.junit.Before;
import org.junit.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class StudentDaoTest {

    private Connection connection;
    @Test
    @Before
    public void getConnection(){
        connection = JDBCUtils.getConnection();
    }

    @Test
    public void getAllStudent() {
        String sql = "select * from StudentTable;";
        List<StudentBean> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                StudentBean studentBean = new StudentBean();
                studentBean.setId(resultSet.getInt(1));
                studentBean.setStudentID(resultSet.getString(2));
                studentBean.setStudentName(resultSet.getString(3));
                studentBean.setSex(resultSet.getString(4));
                studentBean.setMajorName(resultSet.getString(5));
                studentBean.setGrade(resultSet.getInt(6));
                studentBean.setClassNum(resultSet.getString(7));
                studentBean.setBuildNumber(resultSet.getInt(8));
                studentBean.setDormNumber(resultSet.getInt(9));
                list.add(studentBean);
            }
        } catch (
                SQLException e) {
            e.printStackTrace();
        }
        list.forEach(studentBean -> {
            System.out.println(
                    studentBean.getId() + " "
                    + studentBean.getStudentID() + " "
                    + studentBean.getStudentName() + " "
                    + studentBean.getSex() + " "
                    + studentBean.getMajorName() + " "
                    + studentBean.getGrade() + " "
                    + studentBean.getClassNum() + " "
                    + studentBean.getBuildNumber() + " "
                    + studentBean.getDormNumber()
            );
        });
    }

    @Test
    public void testAddStudent(){
        StudentBean studentBean = new StudentBean(

        );
        String sql = "insert into StudentTable(studentID, studentName, sex, majorName, grade, classNum, buildNumber, dormNumber) " +
                "values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,studentBean.getStudentID());
            statement.setString(2,studentBean.getStudentName());
            statement.setString(3,studentBean.getSex());
            statement.setString(4,studentBean.getMajorName());
            statement.setInt(5,studentBean.getGrade());
            statement.setString(6,studentBean.getClassNum());
            statement.setInt(7,studentBean.getBuildNumber());
            statement.setInt(8,studentBean.getDormNumber());
            statement.setInt(9,studentBean.getId());
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}