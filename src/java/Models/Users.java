/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class Users {
    String id,name,account,password,birthday,email,phone,rule,createat,status;

    public Users(String id, String name, String account, String password, String birthday, String email, String phone, String rule, String createat) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
        this.rule = rule;
        this.createat = createat;
    }
    public Users( String name, String account, String password, String birthday, String email, String phone, String rule) {
        this.name = name;
        this.account = account;
        this.password = password;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
        this.rule = rule;
    }
   
    public Users(String id, String name, String birthday, String email, String phone) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
    }

    public Users(String id, String name, String account, String password, String birthday, String email, String phone, String rule, String createat, String status) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
        this.rule = rule;
        this.createat = createat;
        this.status = status;
    }

  

   
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }

    public String getCreateat() {
        return createat;
    }

    public void setCreateat(String createat) {
        this.createat = createat;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", name=" + name + ", account=" + account + ", password=" + password + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", rule=" + rule + ", createat=" + createat + '}';
    }

    public Users() {
    }

  


}
