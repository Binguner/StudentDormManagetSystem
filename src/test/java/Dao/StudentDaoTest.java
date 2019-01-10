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
    public void getAllStudent(){
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
        String studentID = "2016006542";
        String studentName = "连接电视";
        String sex = "女";
        String majorName = "计算机工程";
        int grade = 17;
        String classNum = "经济1732";
        int  buildNumber = 2;
        int dormNumber = 502;
        String sql = "insert into StudentTable(studentID, studentName, sex, majorName, grade, classNum, buildNumber, dormNumber) " +
                "values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,studentID);
            statement.setString(2,studentName);
            statement.setString(3,sex);
            statement.setString(4,majorName);
            statement.setInt(5,grade);
            statement.setString(6,classNum);
            statement.setInt(7,buildNumber);
            statement.setInt(8,dormNumber);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testGetStudentListByMajorName(){
        String majorName = "计算机工程";
        List<StudentBean> list = new ArrayList<>();
        String sql = "select * from StudentTable where majorName=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,majorName);
            ResultSet resultSet = statement.executeQuery();
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
        } catch (SQLException e) {
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
    public void testGetStudentListByDormNumber(){
        List<StudentBean> list = new ArrayList<>();
        int dormNumber = 502;
        String sql = "select * from StudentTable where dormNumber=?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,dormNumber);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        soutStudents(list);
    }

    @Test
    public void testGetStudentListByGradeAndClassNum(){
        int grade = 17;
        String classNum = "软件1732";
        String sql = "select * from StudentTable where grade=? and classNum=?";
        List<StudentBean> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,grade);
            preparedStatement.setString(2,classNum);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        soutStudents(list);
    }

    @Test
    public void testGetThisStudent(){
        String studentId = "2016006533";
        String sql="select * from StudentTable where studentID=?";
        StudentBean studentBean = new StudentBean();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                studentBean.setId(resultSet.getInt(1));
                studentBean.setStudentID(resultSet.getString(2));
                studentBean.setStudentName(resultSet.getString(3));
                studentBean.setSex(resultSet.getString(4));
                studentBean.setMajorName(resultSet.getString(5));
                studentBean.setGrade(resultSet.getInt(6));
                studentBean.setClassNum(resultSet.getString(7));
                studentBean.setBuildNumber(resultSet.getInt(8));
                studentBean.setDormNumber(resultSet.getInt(9));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(studentBean.getId());
        System.out.println(studentBean.getStudentName());
        System.out.println(studentBean.getClassNum());
    }

    @Test
    public void getStudentListByBuildNumber(){
        int buildNumber = 2;
        String sql = "select * from StudentTable where buildNumber=?";
        List<StudentBean> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,buildNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        soutStudents(list);
    }

    @Test
    public void getStudentListBySex(){
        List<StudentBean> list = new ArrayList<>();
        String sex = "男";
        //String sex = "女";
        String sql = "select * from StudentTable where sex=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,sex);
            ResultSet resultSet= preparedStatement.executeQuery();
            while (resultSet.next()){
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        soutStudents(list);
    }

    @Test
    public void getStudentListByGrade(){
        int grade = 17;
        String sql = "select * from StudentTable where grade=?";
        List<StudentBean> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,grade);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
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

        } catch (SQLException e) {
            e.printStackTrace();
        }
        soutStudents(list);
    }

    private void soutStudents(List<StudentBean> list){
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

}