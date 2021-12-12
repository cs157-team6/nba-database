package logic;
public class UserBean {
    private String email;
    private String firstName;
    private String lastName;
    public UserBean(String add, String first, String last) {
    	email = add;
    	firstName = first;
    	lastName = last;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String newFirstName) {
        firstName = newFirstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String newLastName) {
        lastName = newLastName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String newEmail) {
        email = newEmail;
    }		
}