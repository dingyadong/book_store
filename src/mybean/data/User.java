package mybean.data;

public class User {
    private int id;
    private String name;
    private String password;
    private String backNews = "";
    private String email;
    private String phone;
    private String address;
    private String receaddress;
    private String sex;
    private String realname;
    
    public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getReceaddress() {
		return receaddress;
	}
	public void setReceaddress(String receaddress) {
		this.receaddress = receaddress;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	boolean success=false; 


	public String getBackNews() {
		return backNews;
	}
	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

}