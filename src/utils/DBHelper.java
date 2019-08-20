package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {

    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String url="jdbc:mysql://localhost:3306/LogAnalyse?userUnicode=true&characterEncoding=utf-8&useSSL=false";
    private static final String username="root";//数据库的用户名
    private static final String password="mysql";//数据库的密码

    private static Connection conn = null;

    static {
        try {
            Class.forName(driver);
        } catch (Exception e) {

        }
    }

    public static Connection getConnection() throws Exception {
        if (conn == null) {
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        }
        return conn;
    }

//    public static void main(String[] args) {
//        try {
//            Connection conn = DBHelper.getConnection();
//            if (conn == null) {
//                System.out.println("数据连接失败");
//            } else {
//                System.out.println("数据连接成功");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}