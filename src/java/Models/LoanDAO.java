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
public class LoanDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public void addLoan(String idBook, String idUser, String quantity) {
        int num = Integer.valueOf(quantity);
        try {
            String strSQL = "INSERT INTO BorrowRecords (user_id, book_id,borrow_date, status,quantity,added) VALUES(?, ?, GETDATE(),?, ?,0);update Books set quantity = (select quantity from Books where book_id= ?)-? where book_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(idUser));
            stm.setInt(2, Integer.parseInt(idBook));
            stm.setInt(3, 1);
            stm.setInt(4, num);
            stm.setInt(5, Integer.parseInt(idBook));
            stm.setInt(6, num);
            stm.setInt(7, Integer.parseInt(idBook));
            stm.execute();
        } catch (Exception e) {
        }
    }
    
    public void Update(Loans a){
        try {
            String strSQL = "Update BorrowRecords set user_id=?,book_id=?,borrow_date=?,due_date=?,pickup_date=?,return_date=?,quantity=? where borrow_id =?";            
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(a.getUser_id()));
            stm.setInt(2, Integer.parseInt(a.getBook_id()));
            stm.setString(3, a.getBorrow_date());
            stm.setString(4, (a.getDue_date()));
            stm.setString(5, (a.getPickup_date()));
            stm.setString(6, (a.getReturn_date()));
            stm.setInt(7, Integer.parseInt(a.getQuantity()));
            stm.setInt(8, Integer.parseInt(a.getId()));
            stm.execute();
        } catch (Exception e) {
        }
    }
    public void Del(String a){
        try {
            String strSQL = "Delete BorrowRecords where borrow_id=?";            
            stm = connection.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(a));
            stm.execute();
        } catch (Exception e) {
        }
    }
    
    public void updatePickUpDate(String id, String date) {
        try {
            String strSQL = "Update BorrowRecords set pickup_date=? where borrow_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, date);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (Exception e) {
        }
    }
    public void updateReturnDate(String id, String date) {
        try {
            String strSQL = "Update BorrowRecords set return_date=? where borrow_id=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, date);
            stm.setInt(2, Integer.parseInt(id));
            stm.execute();
        } catch (Exception e) {
        }
    }

    public ArrayList<Loans> getLoanByUserId(String id_user) {
        ArrayList<Loans> data = new ArrayList<Loans>();
        try {
            String strSQL = "SELECT * FROM BorrowRecords a JOIN BorrowStatus b ON a.status = b.status_id JOIN Books c ON a.book_id = c.book_id WHERE a.user_id = ? order by a.borrow_date desc;";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id_user);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String user_id = rs.getString(14);
                String book_id = String.valueOf(rs.getInt(3));
                String borrow_date = rs.getString(4);
                String due_date = rs.getString(5);
                String pickup_date = rs.getString(6);
                String return_date = rs.getString(7);
                String status = rs.getString(12);
                String quantity = String.valueOf(rs.getInt(9));
                data.add(new Loans(id, user_id, book_id, borrow_date, due_date, pickup_date, return_date, status, quantity));
            }
        } catch (Exception e) {
        }
        return data;
    }
    public String getCountBooksBorrow() {  
        try {
            String strSQL = "select SUM(a.quantity) from BorrowRecords a where status=2";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String count = String.valueOf(rs.getString(1));
                return count;
            }
        } catch (Exception e) {
        }
        return "0";
    }
    
    public ArrayList<Loans> getAllLoans() {
        ArrayList<Loans> data = new ArrayList<Loans>();
        try {
            String strSQL = "select * from BorrowRecords a JOIN BorrowStatus b ON a.status = b.status_id join Users c on a.user_id=c.user_id join Books d on a.book_id=d.book_id order by borrow_date desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String user_id = rs.getString(16);
                String book_id = rs.getString(23);
                String borrow_date = rs.getString(4);
                String due_date = rs.getString(5);
                String pickup_date = rs.getString(6);
                String return_date = rs.getString(7);
                String status = rs.getString(11);
                String quantity = String.valueOf(rs.getInt(9));
                String email = rs.getString(18);
                data.add(new Loans(id, user_id, book_id, borrow_date, due_date, pickup_date, return_date, status, quantity, email));
            }
        } catch (Exception e) {
        }
        return data;
    }
    public ArrayList<Loans> getAllLoansForAdmin() {
        ArrayList<Loans> data = new ArrayList<Loans>();
        try {
            String strSQL = "select * from BorrowRecords a JOIN BorrowStatus b ON a.status = b.status_id join Users c on a.user_id=c.user_id join Books d on a.book_id=d.book_id order by borrow_date desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String user_id = String.valueOf(rs.getInt(2));
                String book_id = String.valueOf(rs.getInt(3));
                String borrow_date = rs.getString(4);
                String due_date = rs.getString(5);
                String pickup_date = rs.getString(6);
                String return_date = rs.getString(7);
                String status = String.valueOf(rs.getInt(8));
                String quantity = String.valueOf(rs.getInt(9));
                String email = rs.getString(11);
                data.add(new Loans(id, user_id, book_id, borrow_date, due_date, pickup_date, return_date, status, quantity, email));
            }
        } catch (Exception e) {
        }
        return data;
    }

    public ArrayList<Loans> getLoansNonePickUp() {
        ArrayList<Loans> data = new ArrayList<Loans>();
        try {
            String strSQL = "select * from BorrowRecords a JOIN BorrowStatus b ON a.status = b.status_id join Users c on a.user_id=c.user_id join Books d on a.book_id=d.book_id  where a.status=1 and DATEDIFF(DAY, a.borrow_date, GETDATE())<=14  order by borrow_date desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String user_id = rs.getString(16);
                String book_id = rs.getString(23);
                String borrow_date = rs.getString(4);
                String due_date = rs.getString(5);
                String pickup_date = rs.getString(6);
                String return_date = rs.getString(7);
                String status = rs.getString(11);
                String quantity = String.valueOf(rs.getInt(9));
                String email = rs.getString(18);
                data.add(new Loans(id, user_id, book_id, borrow_date, due_date, pickup_date, return_date, status, quantity, email));
            }
        } catch (Exception e) {
        }
        return data;
    }
    public ArrayList<Loans> getLoansPickUp() {
        ArrayList<Loans> data = new ArrayList<Loans>();
        try {
            String strSQL = "select * from BorrowRecords a JOIN BorrowStatus b ON a.status = b.status_id join Users c on a.user_id=c.user_id join Books d on a.book_id=d.book_id  where a.status=2 and DATEDIFF(DAY, a.borrow_date, GETDATE())<=14  order by borrow_date desc";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String user_id = rs.getString(16);
                String book_id = rs.getString(23);
                String borrow_date = rs.getString(4);
                String due_date = rs.getString(5);
                String pickup_date = rs.getString(6);
                String return_date = rs.getString(7);
                String status = rs.getString(11);
                String quantity = String.valueOf(rs.getInt(9));
                String email = rs.getString(18);
                data.add(new Loans(id, user_id, book_id, borrow_date, due_date, pickup_date, return_date, status, quantity, email));
            }
        } catch (Exception e) {
        }
        return data;
    }

    public static void main(String[] args) {
        LoanDAO da = new LoanDAO();
        da.getAllLoansForAdmin();
    }
}
