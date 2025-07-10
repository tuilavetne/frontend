package model;

import java.io.Serializable;

public class User implements Serializable {
    private String lastname, firstname, phone, email, password, gender;

    public User(String lastname, String firstname, String phone,
                String email, String password, String gender) {
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.gender = gender;
    }
    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
