package Model;

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

    public String getFirstname() {
        return firstname;
    }

    public String getFullName() {
        return lastname + " " + firstname;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
}
