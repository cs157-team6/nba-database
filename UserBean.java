package Example;
public class UserBean {
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    public boolean valid;
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
    public String getPassword() {
        return password;
    }
    public void setPassword(String newPassword) {
        password = newPassword;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String newEmail) {
        email = newEmail;
    }		
    public boolean isValid() {
        return valid;
    }
    public void setValid(boolean newValid) {
        valid = newValid;
    }	
}