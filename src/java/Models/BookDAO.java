/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.*;
import dal.DBContext;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class BookDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    PreparedStatement stm1;
    ResultSet rs1;

    public ArrayList<Books> getNewBooks() {
        ArrayList<Books> data = new ArrayList<Books>();
        try {
            String strSQL = "select * from Books where status=1 order by created_at desc ";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            int i = 0;
            while (rs.next()) {
                i++;
                String id = String.valueOf(rs.getString(1));
                String title = rs.getString(2);
                String image = rs.getString(6);
                data.add(new Books(id, title, image));
                if (i == 10) {
                    break;
                }
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Books> getNewBooksByName(String name) {
        ArrayList<Books> data = new ArrayList<Books>();
        try {
            String strSQL = "select * from Books where title like ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, "%" + name + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getString(1));
                String title = rs.getString(2);
                String image = rs.getString(6);
                System.out.println("ngu");
                data.add(new Books(id, title, image));
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Books> getAllBooks() {
        ArrayList<Books> data = new ArrayList<Books>();
        try {
            String strSQL = "select * from Books where status=1 order by created_at desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String author = rs.getString(3);
                String category_id = String.valueOf(rs.getInt(4));
                String quantily = String.valueOf(rs.getInt(5));
                String image = rs.getString(6);
                String created_at = rs.getString(7);
                String introducing = rs.getString(8);
                String page_count = String.valueOf(rs.getInt(9));
                String language = rs.getString(10);
                String publish_year = rs.getString(11);
                String status = String.valueOf(rs.getInt(12));
                System.out.println("ngu");
                data.add(new Books(id, title, author, category_id, quantily, image, created_at, introducing, page_count, language, publish_year, status));
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Books> getAllBooksForAdmin() {
        ArrayList<Books> data = new ArrayList<Books>();
        try {
            String strSQL = "select * from Books a join Categories b on a.category_id=b.category_id order by created_at desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String author = rs.getString(3);
                String category_id = String.valueOf(rs.getInt(4));
                String quantily = String.valueOf(rs.getInt(5));
                String image = rs.getString(6);
                String created_at = rs.getString(7);
                String introducing = rs.getString(8);
                String page_count = String.valueOf(rs.getInt(9));
                String language = rs.getString(10);
                String publish_year = rs.getString(11);
                String status = String.valueOf(rs.getInt(12));
                data.add(new Books(id, title, author, category_id, quantily, image, created_at, introducing, page_count, language, publish_year, status));
            }
        } catch (Exception e) {
        }
        return data;
    }

    public String getCountAllBooks() {
        try {
            String strSQL = "select SUM(quantity) from Books where status=1";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) + "";
            }
        } catch (Exception e) {
        }
        return "0";
    }

    public Books getBookById(String x) {
        try {
            String strSQL = "select * from  Books where book_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.valueOf(x));
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String author = rs.getString(3);
                String category_id = String.valueOf(rs.getInt(4));
                String quantily = String.valueOf(rs.getInt(5));
                String image = rs.getString(6);
                String created_at = rs.getString(7);
                String introducing = rs.getString(8);
                String page_count = String.valueOf(rs.getInt(9));
                String language = rs.getString(10);
                String publish_year = rs.getString(11);
                return new Books(id, title, author, category_id, quantily, image, created_at, introducing, page_count, language, publish_year);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Books> getBooksByCategoryId(String x) {
        ArrayList<Books> data = new ArrayList<Books>();
        try {
            String strSQL = "select * from Books where category_id =? and status=1";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.valueOf(x));
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String author = rs.getString(3);
                String category_id = String.valueOf(rs.getInt(4));
                String quantily = String.valueOf(rs.getInt(5));
                String image = rs.getString(6);
                String created_at = rs.getString(7);
                String introducing = rs.getString(8);
                String page_count = String.valueOf(rs.getInt(9));
                String language = rs.getString(10);
                String publish_year = rs.getString(11);
                data.add(new Books(id, title, author, category_id, quantily, image, page_count, introducing, page_count, language, publish_year));
                System.out.println("1");
            }
        } catch (Exception e) {
        }
        return data;
    }

    public int getQuantityByCategoryId(String x) {
        int i = 0;
        try {
            String strSQL = "select * from Books where category_id =? and status=1";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.valueOf(x));
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String title = rs.getString(2);
                String author = rs.getString(3);
                String category_id = String.valueOf(rs.getInt(4));
                String quantily = String.valueOf(rs.getInt(5));
                String image = rs.getString(6);
                String created_at = rs.getString(7);
                String introducing = rs.getString(8);
                String page_count = String.valueOf(rs.getInt(9));
                String language = rs.getString(10);
                String publish_year = rs.getString(11);
                i++;
            }
        } catch (Exception e) {
        }
        return i;
    }

    public void updateBook(Books a) {
        try {
            String strSQL = "update Books set title=?,author=?,category_id=?,quantity=?,image=?,introduction=?,page_count=?,language=?,publish_year=? where book_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, a.getTitle());
            stm.setString(2, a.getAuthor());
            stm.setInt(3, Integer.valueOf(a.getCategory()));
            stm.setInt(4, Integer.valueOf(a.getQuantity()));
            stm.setString(5, a.getImage());
            stm.setString(6, a.getIntroducing());
            stm.setInt(7, Integer.valueOf(a.getCount()));
            stm.setString(8, a.getLanguage());
            stm.setString(9, a.getPublish());
            stm.setInt(10, Integer.valueOf(a.getId()));
            System.out.println(a.toString());
            stm.execute();
        } catch (Exception e) {
        }
    }

    public void updateBookCurrent() {
        ArrayList<Intit> data = new ArrayList<Intit>();
        try {
            String strSQL = "select * from BorrowRecords a join Books b on a.book_id=b.book_id where DATEDIFF(DAY,  a.borrow_date,GETDATE()) > 14  and a.added = 0;";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(3));
                String quantity = String.valueOf(rs.getInt(9));
                data.add(new Intit(id, quantity));
            }
        } catch (Exception e) {
        }
        int[] arr= new int[data.size()];
        try {
            for (int i = 0; i < data.size(); i++) {
                String strSQL = "select quantity from Books where book_id=?";
                stm = connection.prepareStatement(strSQL);               
                stm.setInt(1, Integer.valueOf(data.get(i).id));            
                rs = stm.executeQuery();    
                while(rs.next()){
                    arr[i]=rs.getInt(1);
                    break;
                }
            }
        } catch (Exception e) {
        }
        try {
            for (int i = 0; i < data.size(); i++) {
                String strSQL = "update Books set quantity=? where book_id=?";
                stm = connection.prepareStatement(strSQL);               
                stm.setInt(1, Integer.valueOf(data.get(i).quantity)+arr[i]);
                stm.setInt(2, Integer.valueOf(data.get(i).id));
                stm.execute();
            }
        } catch (Exception e) {
        }

        try {
            for (int i = 0; i < data.size(); i++) {
                String strSQL = "update BorrowRecords set added=1 where DATEDIFF(DAY,  borrow_date,GETDATE()) > 14  and added = 0;";
                stm = connection.prepareStatement(strSQL);
                stm.execute();
            }
        } catch (Exception e) {
        }

    }

    public void updateStatus(String a, String b) {
        try {
            String strSQL = "update Books set status =? where book_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.valueOf(b));
            stm.setInt(2, Integer.valueOf(a));
            stm.execute();
        } catch (Exception e) {
        }
    }

    public void Add(Books x) {
        try {
            String strSQL = "INSERT INTO Books (title, author, category_id, quantity, image,introduction, page_count,language,publish_year) VALUES (?,?,?,?,?,?,?,?,?) ";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, x.getTitle());
            stm.setString(2, x.getTitle());
            stm.setInt(3, Integer.valueOf(x.getCategory()));
            stm.setInt(4, Integer.valueOf(x.getQuantity()));
            stm.setString(5, x.getImage());
            stm.setString(6, x.getIntroducing());
            stm.setInt(7, Integer.valueOf(x.getCount()));
            stm.setString(8, x.getLanguage());
            stm.setString(9, x.getPublish());
            stm.execute();
        } catch (Exception e) {
        }
    }

    public void updateQuantityById(String id, String num) {
        try {
            String strSQL = "Update Books set quantity=? where book_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.valueOf(num));
            stm.setInt(2, Integer.valueOf(id));
            stm.execute();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        BookDAO da = new BookDAO();
        da.updateBookCurrent();
    }
}
