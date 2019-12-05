package cn.edu.sdjzu.xg.bysj.controller.basic;

import cn.edu.sdjzu.xg.bysj.service.UserService;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/user.ctl")
public class UserController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        JSONObject message = new JSONObject();
        try {
            boolean result = UserService.getInstance().changePassword(
                    request.getParameter("username"),
                    request.getParameter("newPassword"));
            if (result) message.put("message","修改成功");
            else message.put("message","修改失败");
        } catch (SQLException e) {
            message.put("message","数据库异常");
        } catch (Exception e){
            message.put("message","其他异常");
        }
        //响应message到前端
        response.getWriter().println(message);
    }


    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {


    }
    //响应一个专业对象
    private void responseDepartment(int id, HttpServletResponse response)
            throws IOException, SQLException {

    }
    //响应所有专业对象
    private void responseDepartments(HttpServletResponse response)
            throws IOException, SQLException {

    }

    //响应所有专业对象
    private void responseDepartmentsBySchool(int schoolId,HttpServletResponse response)
            throws IOException, SQLException {

    }

}
