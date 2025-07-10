package model;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {
    private String id;
    private String fullName;
    private String phone;
    private String address;
    private String note;
    private String payment;
    private String status;
    private List<CartItem> items;

    public Order(String id, String fullName, String phone, String address, String note, String payment, List<CartItem> items) {
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.payment = payment;
        this.items = items;
        this.status = "pending"; 
    }

    public String getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getNote() {
        return note;
    }

    public String getPayment() {
        return payment;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalAmount() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getTotal();
        }
        return total + 15000;
    }
} 
