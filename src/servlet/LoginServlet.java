package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import item.Users;
import utils.DBHelper;

import javax.servlet.annotation.WebServlet;

public class LoginServlet extends javax.servlet.http.HttpServlet {

    public LoginServlet() {
        super();
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Users users = new Users();
        String username = request.getParameter("username"); //获取页面数据
        String password = request.getParameter("password");

        try {
            int flag = 0;
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/LogAnalyse?userUnicode=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true";
            String mysqlusername="root";//数据库的用户名
            String mysqlpassword="mysql";//数据库的密码

            Connection conn = DriverManager.getConnection(url, mysqlusername, mysqlpassword);
            Statement stmt = conn.createStatement();
            String sql = "select password from users where username='" + username + "';";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String pwd = rs.getString("password");  //读数据库数据
                if (pwd.indexOf(password) != -1) {
                    request.getRequestDispatcher("FindNginx").forward(request, response);  //页面跳转
                } else {
                    flag = 1;
                    request.setAttribute("result", flag);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request, response);
    }

    public void destory() {
        super.destroy();
    }
}