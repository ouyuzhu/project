package raky.train.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.Vector;

import com.mysql.jdbc.JDBC4PreparedStatement;

import raky.train.util.JDBCUtil;
import raky.train.entity.Tickets;

public class UserDao {
	 public static boolean check(String username) {
         boolean flag=false;
         Connection conn=null;
         PreparedStatement  ps=null;
         ResultSet res=null;
         try{
             conn=JDBCUtil.getConn();
             String sql="select * from user_info where username=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1,username);
             res=ps.executeQuery();
             if(res.next())flag=true;
         }
         catch (Exception e){
             flag=false;
         }
         finally {
             JDBCUtil.close(conn,ps,res);
         }
         return flag;
     }//注册时用来查看是否已经有这个昵称
     public static boolean check(String username, String password) {
         boolean flag=false;
         Connection conn=null;
         PreparedStatement  ps=null;
         ResultSet res=null;
         try{
             conn=JDBCUtil.getConn();
             String sql="SELECT * FROM user_info WHERE username=? and password=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1,username);
             ps.setString(2,password);
             res=ps.executeQuery();
             if(res.next())flag=true;
         }
         catch (Exception e){
             flag=false;
         }
         finally {
             JDBCUtil.close(conn,ps,res);
         }
         return flag;
     }//登录时用来判断是否有这个人
     public static boolean register(String username, String password,String truename,String id_card,String phone) {
         Connection conn=null;
         PreparedStatement  ps=null;
         try {
             conn=JDBCUtil.getConn();
             String sql="INSERT into user_info (username,password,truename,id_card,phone) VALUES(?,?,?,?,?)";
             ps=conn.prepareStatement(sql);
             ps.setString(1, username);
             ps.setString(2,password);
             ps.setString(3,truename);
             ps.setString(4,id_card);
             ps.setString(5,phone);
             System.out.println(((JDBC4PreparedStatement)ps).asSql());
             int row=ps.executeUpdate();
             System.out.println(row);
             return true;
         } catch (Exception e) {
             return false;
         }finally {
             JDBCUtil.close(conn, ps, null);
         }
     }//注册的接口
     public static Vector<Vector<String>> select(String start,String stop){
         Vector <Vector<String>> list=new Vector<>();
         Connection conn=null;
         PreparedStatement  ps=null;
         ResultSet res=null;
         try {
             conn=JDBCUtil.getConn();
             String sql="SELECT * FROM ticks_info WHERE start=? AND stop=? AND votes >0;";
             ps=conn.prepareStatement(sql);
             ps.setString(1,start);
             ps.setString(2,stop);
             res=ps.executeQuery();
             while(res.next()){
                 Vector <String> user=new Vector<>();
                 user.add(res.getString("tickets_id"));
                 user.add(res.getString("start"));
                 user.add(res.getString("stop"));
                 user.add(res.getString("votes"));
                 user.add(res.getString("s_time"));
                 user.add(res.getString("a_time"));
                 user.add(res.getString("price"));
                 list.add(user);
             }
             return list;
         }
         catch (Exception e){
             e.printStackTrace();
             return null;
         }
         finally {
             JDBCUtil.close(conn,ps,res);
         }
     }//先查票
     public static boolean buy(String user,Vector<String> a){
         Connection conn=null;
         Connection conn1=null;
         PreparedStatement ps=null;
         PreparedStatement ps1=null;
         try{
             conn=JDBCUtil.getConn();
             String sql="INSERT INTO ut_info VALUES (?,?,?,?,?,?,?)";
             ps=conn.prepareStatement(sql);
             ps.setString(1,user);
             ps.setString(2,a.get(0));
             ps.setString(3,a.get(1));
             ps.setString(4,a.get(2));
             ps.setString(5,a.get(4));
             ps.setString(6,a.get(5));
             ps.setDouble(7,Double.parseDouble(a.get(6)));
             int row=ps.executeUpdate();
             System.out.println("您买了"+row+"张票");
             conn1=JDBCUtil.getConn();
             String sql1="UPDATE ticks_info SET votes=votes-1 WHERE tickets_id=? AND start=? AND stop=?";
             ps1=conn1.prepareStatement(sql1);
             ps1.setString(1,a.get(0));
             ps1.setString(2,a.get(1));
             ps1.setString(3,a.get(2));
             ps1.executeUpdate();
             return true;
         }
         catch (Exception e){
             e.printStackTrace();
             return false;
         }
         finally {
             JDBCUtil.close(conn,ps,null);
             JDBCUtil.close(conn1,ps1,null);
         }
     }//再买票
     public static boolean nobuy(String user,Vector<String> order){
         Connection conn=null;
         Connection conn1=null;
         PreparedStatement ps=null;
         PreparedStatement ps1=null;
         try{
             conn= JDBCUtil.getConn();
             String sql="DELETE FROM ut_info WHERE username=? AND tickets_id=? AND start=? AND stop=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1,user);
             ps.setString(2,order.get(0));
             ps.setString(3,order.get(1));
             ps.setString(4,order.get(2));
             ps.executeUpdate();
             conn1= JDBCUtil.getConn();
             String sql1="UPDATE ticks_info SET votes=votes+1 WHERE tickets_id=? AND start=? AND stop=?";
             ps1=conn.prepareStatement(sql1);
             ps1.setString(1,order.get(0));
             ps1.setString(2,order.get(1));
             ps1.setString(3,order.get(2));
             int row=ps1.executeUpdate();
             System.out.println("您退了"+row+"张票");
             return true;
         }
         catch (Exception e){
             e.printStackTrace();
             return false;
         }
         finally {
             JDBCUtil.close(conn,ps,null);
             JDBCUtil.close(conn1,ps1,null);
         }
     }//尝试退票，成功返回true
     public static Vector<Vector<String>> goods(String username){
         Vector <Vector<String>> list=new Vector<>();
         Connection conn=null;
         PreparedStatement ps=null;
         ResultSet res=null;
         try{
             conn=JDBCUtil.getConn();
             String sql="SELECT tickets_id,start,stop,s_time,a_time,price FROM ut_info WHERE username=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1,username);
             res=ps.executeQuery();
             while(res.next()){
                 Vector <String> user=new Vector<>();
                 user.add(res.getString("tickets_id"));
                 user.add(res.getString("start"));
                 user.add(res.getString("stop"));
                 user.add(res.getString("s_time"));
                 user.add(res.getString("a_time"));
                 user.add(res.getString("price"));
//                 user.setTickets_id();
//                 user.setStart(res.getString("start"));
//                 user.setStop(res.getString("stop"));
//                 user.setS_time(res.getString("s_time"));
//                 user.setA_time(res.getString("a_time"));
//                 user.setPrice(res.getDouble("price"));
                 list.add(user);
             }
             return list;
         }catch (Exception e){
             e.printStackTrace();
             return null;
         }
         finally {
             JDBCUtil.close(conn,ps,res);
         }
     }//获取用户的票
     public static LinkedList<Tickets> selectall(){
         LinkedList <Tickets>list=new LinkedList<>();
         Connection conn=null;
         PreparedStatement  ps=null;
         ResultSet res=null;
         try{
             conn=JDBCUtil.getConn();
             String sql="SELECT * FROM ticks_info";
             ps=conn.prepareStatement(sql);
             res=ps.executeQuery();
             while(res.next()){
                 Tickets ticket=new Tickets();
                 ticket.setTickets_id(res.getString(1));
                 ticket.setStart(res.getString(2));
                 ticket.setStop(res.getString(3));
                 ticket.setVotes(res.getInt(4));
                 ticket.setS_time(res.getString(5));
                 ticket.setA_time(res.getString(6));
                 ticket.setPrice(res.getDouble(7));
                 list.add(ticket);
             }return list;
         }
         catch (Exception e){
             e.printStackTrace();
             return list;
         }
         finally {
             JDBCUtil.close(conn,ps,res); 
         }
     }//用户和管理员登陆成功后界面显示出来的票的信息
     public static String[] info(String user) {
    	 String[] a=new String[6];
    	 Connection conn=null;
         PreparedStatement ps=null;
         ResultSet res=null;
         try{
             conn=JDBCUtil.getConn();
             String sql="select * from user_info where username=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1,user);
             res=ps.executeQuery();
             if (res.next()) {
               a[0]=res.getString("username");
               a[1]=res.getString("password");
               a[2]=res.getString("truename");
               a[3]=res.getString("id_card");
               a[4]=res.getString("phone");
			}
             else a=null;
         }
         catch (Exception e){
        	e.printStackTrace();
         }
         finally {
             JDBCUtil.close(conn,ps,res);
         }
    	 return a;
     }
     public static boolean update(String password,String phone,String username) {
    	 boolean flag=false;
         Connection conn=null;
         PreparedStatement ps=null;
         ResultSet res=null;
         try{
        	 //System.out.println(username+"/"+phone+"/"+password);
             conn=JDBCUtil.getConn();
             String sql="UPDATE user_info SET password=? , phone=? WHERE username= ?";
             ps=conn.prepareStatement(sql);
             ps.setString(1,password);
             ps.setString(2,phone);
             ps.setString(3,username);
             int row=ps.executeUpdate();
             //System.out.println(row);
             flag=true;
         }
         catch (Exception e){
        	 e.printStackTrace();
         }
         finally {
             JDBCUtil.close(conn,ps,null);
         }
         return flag;
     }
     public static LinkedList<Tickets> time_select(String tickets_id){
    	 Connection conn=null;
         PreparedStatement  ps=null;
         ResultSet res=null;
         LinkedList <Tickets>list=new LinkedList<>();
         try{
             conn=JDBCUtil.getConn();
             String sql="select * from ticks_info where tickets_id=?";
             ps=conn.prepareStatement(sql);
             ps.setString(1,tickets_id);
             res=ps.executeQuery();
             while(res.next()) {
            	 Tickets ticket=new Tickets();
                 ticket.setTickets_id(res.getString(1));
                 ticket.setStart(res.getString(2));
                 ticket.setStop(res.getString(3));
                 ticket.setVotes(res.getInt(4));
                 ticket.setS_time(res.getString(5));
                 ticket.setA_time(res.getString(6));
                 ticket.setPrice(res.getDouble(7));
                 list.add(ticket);
             }
             return list;
         }
         catch (Exception e){
             e.printStackTrace();
             return list;
         }
         finally {
             JDBCUtil.close(conn,ps,res);
         }
     }
}
