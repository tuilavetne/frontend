package model;

public class CartItem {
    private String name;
    private double price;
    private int quantity;
    private String note;
    private String image;

    public CartItem(String name, double price, int quantity, String note, String image) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.note = note;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    public double getTotal() {
    return price * quantity;
    }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}

