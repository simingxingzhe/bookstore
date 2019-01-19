package com.excel.bookstore.bookmanageserver.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name="t_book")
public class Book {
    /**主键，编号**/
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, unique = true)
    /**书名**/
    private String name;
    @Column(nullable = false)
    /**书籍类型**/
    private String type;
    /**书号**/
    @Column(nullable = false)
    private String isbn;
    /**简述**/
    @Column(nullable = false)
    private String short_desc;
    /**描述**/
    private String long_desc;
    /**定价**/
    @Column(nullable = false)
    private Long price;
    /**折扣**/
    @Column(nullable = false)
    private Long discount;
    /**库存**/
    @Column(nullable = false)
    private Long inventory;
    /**创建时间**/
    @Column(nullable = false)
    private Date create_datetime;
    /**最后修改时间**/
    @Column(nullable = false)
    private Date last_modify_datetime;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getShort_desc() {
        return short_desc;
    }

    public void setShort_desc(String short_desc) {
        this.short_desc = short_desc;
    }

    public String getLong_desc() {
        return long_desc;
    }

    public void setLong_desc(String long_desc) {
        this.long_desc = long_desc;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Long getDiscount() {
        return discount;
    }

    public void setDiscount(Long discount) {
        this.discount = discount;
    }

    public Long getInventory() {
        return inventory;
    }

    public void setInventory(Long inventory) {
        this.inventory = inventory;
    }

    public Date getCreate_datetime() {
        return create_datetime;
    }

    public void setCreate_datetime(Date create_datetime) {
        this.create_datetime = create_datetime;
    }

    public Date getLast_modify_datetime() {
        return last_modify_datetime;
    }

    public void setLast_modify_datetime(Date last_modify_datetime) {
        this.last_modify_datetime = last_modify_datetime;
    }

    @Override
    public String toString() {
        return "Book [id=" + id + ", name=" + name + ", type=" + type + ", isbn=" + isbn
                + ", short_desc=" + short_desc + ", long_desc=" + long_desc + ", price=" + price
                + ", discount=" + discount + ", inventory=" + inventory
                + ", create_datetime=" + create_datetime + ", last_modify_datetime=" + last_modify_datetime+ "]";
    }

}
