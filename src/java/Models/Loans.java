/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class Loans {

    String id, user_id, book_id, borrow_date, due_date, pickup_date, return_date, status, quantity, email;

    public Loans(String id, String user_id, String book_id, String borrow_date, String due_date, String pickup_date, String return_date, String status, String quantity) {
        this.id = id;
        this.user_id = user_id;
        this.book_id = book_id;
        this.borrow_date = borrow_date;
        this.due_date = due_date;
        this.pickup_date = pickup_date;
        this.return_date = return_date;
        this.status = status;
        this.quantity = quantity;
    }

    public Loans(String id, String user_id, String book_id, String borrow_date, String due_date, String pickup_date, String return_date, String status, String quantity, String email) {
        this.id = id;
        this.user_id = user_id;
        this.book_id = book_id;
        this.borrow_date = borrow_date;
        this.due_date = due_date;
        this.pickup_date = pickup_date;
        this.return_date = return_date;
        this.quantity = quantity;
        this.status = status;
        this.email = email;
    }

    public Loans() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getBorrow_date() {
        return borrow_date;
    }

    public void setBorrow_date(String borrow_date) {
        this.borrow_date = borrow_date;
    }

    public String getDue_date() {
        return due_date;
    }

    public void setDue_date(String due_date) {
        this.due_date = due_date;
    }

    public String getPickup_date() {
        return pickup_date;
    }

    public void setPickup_date(String pickup_date) {
        this.pickup_date = pickup_date;
    }

    public String getReturn_date() {
        return return_date;
    }

    public void setReturn_date(String return_date) {
        this.return_date = return_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Loans{" + "id=" + id + ", user_id=" + user_id + ", book_id=" + book_id + ", borrow_date=" + borrow_date + ", due_date=" + due_date + ", pickup_date=" + pickup_date + ", return_date=" + return_date + ", status=" + status + ", quantity=" + quantity + ", email=" + email + '}';
    }

}
