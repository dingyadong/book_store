package mybean.data;

public class Order {
    int id;
    User user;
    String cratedata;


	public String getCratedata() {
		return cratedata;
	}
	public void setCratedata(String cratedata) {
		this.cratedata = cratedata;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
}
