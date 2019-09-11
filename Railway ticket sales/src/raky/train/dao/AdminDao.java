package raky.train.dao;

import java.sql.*;

import raky.train.util.JDBCUtil;

public class AdminDao {
	static Connection conn=null;
	static PreparedStatement  ps=null;
	static ResultSet res=null;
	public static boolean check(String username, String password) {
        boolean flag=false;
        try{
            conn=JDBCUtil.getConn();
            String sql="SELECT * FROM admin_info WHERE username=? and password=?";
            ps=conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            res=ps.executeQuery();
            if(res.next())
            	flag=true;
        }
        catch (Exception e){
            flag=false;
        }
        finally {
            JDBCUtil.close(conn,ps,res);
        }
        return flag;
    }//����Ա��¼���
    /* �������ǹ���Ա��Ʊ����Ϣ���в���*/
    public static boolean add(String tickets_id,String start,String stop,int votes,String s_time,String a_time,double price){
        try{
            conn=JDBCUtil.getConn();
            String sql="INSERT into ticks_info VALUES(?,?,?,?,?,?,?)";
            ps=conn.prepareStatement(sql);
            ps=conn.prepareStatement(sql);
            ps.setString(1,tickets_id);
            ps.setString(2,start);
            ps.setString(3,stop);
            ps.setInt(4,votes);
            ps.setString(5,s_time);
            ps.setString(6,a_time);
            ps.setDouble(7,price);
            ps.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        finally {
            JDBCUtil.close(conn,ps,null);
        }
    }
    /*����Աʵʱ��������*/
    public static void update(){
      
        try{
            JDBCUtil.getConn();
        }catch (Exception e){

        }
        finally {

        }
    }
    /*����Աɾ��������Ϣ*/
    public static boolean delete(String tickets_id){
        try{
            conn=JDBCUtil.getConn();
            String sql="DELETE FROM ticks_info WHERE tickets_id =?";
            ps=conn.prepareStatement(sql);
            ps.setString(1,tickets_id);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            return false;
        }
        finally {
            JDBCUtil.close(conn,ps,null);
        }
    }
}
