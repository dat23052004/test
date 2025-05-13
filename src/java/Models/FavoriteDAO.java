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
public class FavoriteDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    public ArrayList<Favorite> getFavoriteByUserId(String x){
        ArrayList<Favorite> data=new ArrayList<Favorite>();
        try {
            String strSQL = "select * from BookFavorite a join Books b on a.book_id=b.book_id where user_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(x));
            rs = stm.executeQuery();
            while(rs.next()){
                String iduser= rs.getInt(1)+"";
                String idbook= rs.getInt(2)+"";
                String title= rs.getString(4);
                String img= rs.getString(8); 
                String author= rs.getString(5);
                data.add(new Favorite(iduser, idbook, title, img,author));
            }
        } catch (Exception e) {
        }
        return data;
    }
    public void DeleteById(String userid,String bookid){
        try {
            String strSQL = "delete from BookFavorite where user_id=? and book_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(userid));
            stm.setInt(2, Integer.parseInt(bookid));
            stm.execute();        
        } catch (Exception e) {
        }
    }
    public void Add(String userID,String bookID){
        try {
            String strSQL = "INSERT INTO BookFavorite (user_id, book_id) VALUES (?, ?);";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(userID));
            stm.setInt(2, Integer.parseInt(bookID));
            stm.execute();
           
        } catch (Exception e) {
        }
    }
    
    public boolean checkFavorite(String UserId,String bookID){
         try {
            String strSQL = "select * from BookFavorite where user_id=? and book_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(UserId));
            stm.setInt(2, Integer.parseInt(bookID));
            rs = stm.executeQuery();
            while(rs.next()){
                return true;
            }
        } catch (Exception e) {
        }
         return false;
    }
}
