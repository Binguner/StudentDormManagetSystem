package Servlet;

import Dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HandleDormServlet")
public class HandleDormServlet extends HttpServlet {
    public static final int DIS_DORM = 0;
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
                if (null != classNameList){
                    for(int className = 0; className<classNameList.size();className++){
                        int all = StudentDao.getThisClassAllPeopleCount(classNameList.get(className));
                        int boy = StudentDao.getThisClassBoyCount(classNameList.get(className));
                        int girl = StudentDao.getThisClassGirlCount(classNameList.get(className));

                    }
                }
                break;
        }
    }
}
