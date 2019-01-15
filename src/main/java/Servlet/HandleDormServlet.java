package Servlet;

import Bean.StudentBean;
import Dao.StudentDao;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.management.StandardEmitterMBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HandleDormServlet")
public class HandleDormServlet extends HttpServlet {
    public static final int DIS_DORM = 0;
    public static final int GET_DORM_LIST = 1;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int type = Integer.parseInt(request.getParameter("type"));
        switch (type){
            case DIS_DORM:
                List<String> classNameList = StudentDao.getClassNameList();
                int studentNumber = StudentDao.getStudentCount();
                int buildNumberNeed = (studentNumber/360)+1;
                List<StudentBean> g_list = new ArrayList<>();
                List<StudentBean> b_list = new ArrayList<>();
                System.out.println(buildNumberNeed);
                for(int className = 0; className<classNameList.size();className++){
                    List<StudentBean> list = StudentDao.getGirlListByClassName(classNameList.get(className));
                    g_list.addAll(list);
                }
                for(int className = 0; className<classNameList.size();className++){
                    List<StudentBean> list = StudentDao.getBoyListByClassName(classNameList.get(className));
                    b_list.addAll(list);
                }
                g_list.addAll(b_list);
                int number = 0;
                try {
                    for (int buildCount = 1;buildCount <= buildNumberNeed;buildCount++){
                        for (int floorCount = 1; floorCount <= 5; floorCount++){
                            for(int dormNumebr = 1; dormNumebr <= 18; dormNumebr++){
                                for(int peopleCount = 1; peopleCount <= 4; peopleCount++){
                                    int dornnn = Integer.parseInt(floorCount+"0"+dormNumebr);
                                    StudentDao.setBuildNumberDormNumber(g_list.get(number).getId(),buildCount,dornnn);
                                    number++;
                                }
                            }
                        }
                    }
                    response.getWriter().write("0");
                }catch (IndexOutOfBoundsException e){
                    //e.printStackTrace();
                }
                break;
            case GET_DORM_LIST:
                List<StudentBean> list = StudentDao.getAllStudent();
                String responseText = JSON.toJSONString(list);
                //System.out.println(responseText);
                response.getWriter().write(responseText);
                break;
        }
    }
}
