package mybean.data;

public class CarRecord {
int id;
String adminname; //所有属性名字母都要小写，JSP 标准标签库（JSTL）会与带有大写字的写属性冲突
String bookname;
String img;
int bookid;
String bookpress;
String bookqutline;
int bookprice;
String bookauthor;
String cratedate;
int number;
public String getBookqutline() {
	return bookqutline;
}
public void setBookqutline(String bookqutline) {
	this.bookqutline = bookqutline;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public int getBookid() {
	return bookid;
}
public void setBookid(int bookid) {
	this.bookid = bookid;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getAdminname() {
	return adminname;
}
public void setAdminname(String adminname) {
	this.adminname = adminname;
}
public String getBookname() {
	return bookname;
}
public void setBookname(String bookname) {
	this.bookname = bookname;
}
public String getBookpress() {
	return bookpress;
}
public void setBookpress(String bookpress) {
	this.bookpress = bookpress;
}
public int getBookprice() {
	return bookprice;
}
public void setBookprice(int bookprice) {
	this.bookprice = bookprice;
}
public String getBookauthor() {
	return bookauthor;
}
public void setBookauthor(String bookauthor) {
	this.bookauthor = bookauthor;
}
public String getCratedate() {
	return cratedate;
}
public void setCratedate(String cratedate) {
	this.cratedate = cratedate;
}
public int getNumber() {
	return number;
}
public void setNumber(int number) {
	this.number = number;
}



}
