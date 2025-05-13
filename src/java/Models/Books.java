package Models;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ADMIN
 */
public class Books {

    String id, title, author, category, quantity, image, date_create, introducing, count, language, publish, status;

    public Books(String id, String title, String author, String category, String quantity, String image, String date_create) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.category = category;
        this.quantity = quantity;
        this.image = image;
        this.date_create = date_create;
    }

    public Books(String title, String author, String category, String quantity, String image) {
        this.title = title;
        this.author = author;
        this.category = category;
        this.quantity = quantity;
        this.image = image;
    }

    public Books(String id, String title, String author, String category, String quantity, String image, String introducing, String count, String language, String publish) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.category = category;
        this.quantity = quantity;
        this.image = image;
        this.introducing = introducing;
        this.count = count;
        this.language = language;
        this.publish = publish;
    }

    public Books(String id, String title, String author, String category, String quantity, String image, String date_create, String introducing, String count, String language, String publish) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.category = category;
        this.quantity = quantity;
        this.image = image;
        this.date_create = date_create;
        this.introducing = introducing;
        this.count = count;
        this.language = language;
        this.publish = publish;
    }

    public Books(String id, String title, String author, String category, String quantity, String image, String date_create, String introducing, String count, String language, String publish, String status) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.category = category;
        this.quantity = quantity;
        this.image = image;
        this.date_create = date_create;
        this.introducing = introducing;
        this.count = count;
        this.language = language;
        this.publish = publish;
        this.status = status;
    }

    public Books(String id, String title, String image) {
        this.id = id;
        this.title = title;
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDate_create() {
        return date_create;
    }

    public void setDate_create(String date_create) {
        this.date_create = date_create;
    }

    public String getIntroducing() {
        return introducing;
    }

    public void setIntroducing(String introducing) {
        this.introducing = introducing;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Books{" + "id=" + id + ", title=" + title + ", author=" + author + ", category=" + category + ", quantity=" + quantity + ", image=" + image + ", date_create=" + date_create + ", introducing=" + introducing + ", count=" + count + ", language=" + language + ", publish=" + publish + ", status=" + status + '}';
    }

}
