/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.*;
import dal.DBContext;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    
    public ArrayList<Users> getAllUser(){
        ArrayList<Users> data= new ArrayList<>();
        try {
           String strSQL = "select * from Users a join Roles b on a.role=b.role_id where a.role <> 3 order by role desc";
            stm = connection.prepareStatement(strSQL); 
            rs = stm.executeQuery();
            while (rs.next()) {
                String id=String.valueOf(rs.getInt(1));
                String account=rs.getString(2);
                String password=rs.getString(3);
                String name=rs.getString(4);
                String birthday=rs.getString(5);
                String email=rs.getString(6);
                String phone=rs.getString(7);
                String role=rs.getString(12);
                String status=String.valueOf(rs.getInt(9));
                String creatat=rs.getString(10);
                data.add(new Users(id, name, account, password, birthday, email, phone, role, creatat, status));
            }
        } catch (Exception e) {
        }
        return data;
    }
    public boolean checkUser(String account, String password) {
        try {
            String strSQL = "select * from Users where account=? and password=? and status=1";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }
    public boolean checkLibrian() {
        try {
            String strSQL = "select * from Users where role=2";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public boolean checkExistUser(String x) {
        try {
            String strSQL = "select * from Users where account=? and status=1";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }
    public boolean checkExistUserNoStatus(String x) {
        try {
            String strSQL = "select * from Users where account=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }
    
    public boolean checkExistEmail(String x) {
        try {
            String strSQL = "select * from Users where email=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    public Users getinforbyAccount(String a) {
        Users data = new Users();
        try {
            String strSQL = "select * from users where account=? and status=1";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, a);
            rs = stm.executeQuery();//neu su dung select dung ham nay
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String account = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String birthday = rs.getString(5); // Hoặc rs.getDate(5).toString() nếu cần
                String email = rs.getString(6);
                String phone = rs.getString(7); // Đúng cột dữ liệu
                String rule = String.valueOf(rs.getInt(8)); // Đúng cột dữ liệu
                String createat = rs.getString(10);// Đúng cột dữ liệu
                data = new Users(id, name, account, password, birthday, email, phone, rule, createat);
                break;
            }
        } catch (Exception e) {

        }
        return data;
    }

    public void add(Users x) {
        try {
            String strSQL = "INSERT INTO Users (account, password, name, birthday, email, phone, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x.getAccount());
            stm.setString(2, x.getPassword());
            stm.setString(3, x.getName());
            stm.setString(4, x.getBirthday());
            stm.setString(5, x.getEmail());
            stm.setString(6, x.getPhone());
            stm.setInt(7, Integer.parseInt(x.getRule()));
            System.out.println(x.toString());
            stm.execute();
        } catch (Exception e) {
        }
    }
    
    public void updateUserToLibrian(String id) {
        try {
            String strSQL = "Update Users set role=2 where user_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            stm.execute();
        } catch (Exception e) {
        }
    }
    public void updatePassById(String id,String pass) {
        try {
            String strSQL = "update Users set password= ? where user_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, pass);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (Exception e) {
        }
    }
    public void updateStatusById(String id,String status) {
        try {
            String strSQL = "Update Users set status=? where user_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(status));
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (Exception e) {
        }
    }
    public void updateAllById(Users x,String id) {
        try {
            String strSQL = "Update Users set account=?,password=?,name=?,birthday=?,email=?,phone=? where user_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x.getAccount());
            stm.setString(2, x.getPassword());
            stm.setString(3, x.getName());
            stm.setString(4, x.getBirthday());
            stm.setString(5, x.getEmail());
            stm.setString(6, x.getPhone());
            stm.setInt(7, Integer.parseInt(id));
            stm.execute();
        } catch (Exception e) {
        }
    }
    public void updateByUser(Users x) {
        try {
            String strSQL = "update Users set name=?,birthday=?,email=?,phone=? where user_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x.getName());
            stm.setString(2, x.getBirthday());
            stm.setString(3, x.getEmail());
            stm.setString(4, x.getPhone());
            stm.setInt(5, Integer.parseInt(x.getId()));
            stm.execute();
        } catch (Exception e) {
        }
    }

    public Users getinforbyId(String x) {
        Users data = new Users();
        try {
            String strSQL = "select * from users where user_id=? and status=1";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x);
            rs = stm.executeQuery();//neu su dung select dung ham nay
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String account = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String birthday = rs.getString(5); // Hoặc rs.getDate(5).toString() nếu cần
                String email = rs.getString(6);
                String phone = rs.getString(7); // Đúng cột dữ liệu
                String rule = String.valueOf(rs.getInt(8)); // Đúng cột dữ liệu
                String createat = rs.getString(10);// Đúng cột dữ liệu
                data = new Users(id, name, account, password, birthday, email, phone, rule, createat);
                break;
            }
        } catch (Exception e) {

        }
        return data;
    }
    public static void main(String[] args) {
        UserDAO da = new UserDAO();
        da.getAllUser();
    }

    
}
