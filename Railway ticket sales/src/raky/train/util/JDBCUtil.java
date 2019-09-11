package raky.train.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	    public static String url="jdbc:mysql://localhost:3306/tickets?useUnicode=true&amp;characterEncoding=utf-8";//������http�ϵ�Զ�����ݿ�
	    public static String user="root";
	    public static String pwd="root";
	    public static String driverName="com.mysql.jdbc.Driver";
	    static {//�ŵ���̬��������ֻ��ִ��һ��
	        try {
	            Class.forName(driverName);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }
	    public static Connection getConn(){//ÿһ�ζ�Ҫ��������
	        try {
	            return DriverManager.getConnection(JDBCUtil.url,JDBCUtil.user,JDBCUtil.pwd);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	    public static void close(Connection conn,Statement st,ResultSet res){
	        //�ͷ���Դ
	        if(res!=null)
	            try {
	                res.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        if(st!=null)
	            try {
	                st.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        if(conn!=null)
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	    }
	}