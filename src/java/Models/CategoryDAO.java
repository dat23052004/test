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
public class CategoryDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<Categories> getListCategory() {
        ArrayList<Categories> data = new ArrayList<Categories>();
        try {
            String strSQL = "select * from Categories order by category_id";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getString(1));
                String name = rs.getString(2);
                String introduction = rs.getString(3);
                data.add(new Categories(id, name, introduction));
            }
        } catch (Exception e) {
        }
        return data;
    }
    public ArrayList<String> getListCountCategory() {
        ArrayList<String> data = new ArrayList<String>();
        try {
            String strSQL = "select a.category_id, count(book_id) as 'count' from Categories a join Books b on a.category_id=b.category_id group by a.category_id order by category_id";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String count = String.valueOf(rs.getString(2));
                data.add(count);
            }
        } catch (Exception e) {
        }
        return data;
    }

    public Categories getCategoryById(String x) {
        Categories data = new Categories();
        try {
            String strSQL = "select * from Categories where category_id = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getString(1));
                String name = rs.getString(2);
                String introduction = rs.getString(3);
                data = new Categories(id, name, introduction);
            }
        } catch (Exception e) {
        }
        return data;
    }
}
