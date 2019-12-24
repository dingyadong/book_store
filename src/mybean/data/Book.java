package mybean.data;

public class Book {
 private int id;//商品id
 private String name;//商品名字
 private float price;
 private String img;
 private int dealmount;
 private String bookqutline;
 private int isbn;

public String getBookqutline() {
	return bookqutline;
}
public void setBookqutline(String bookqutline) {
	this.bookqutline = bookqutline;
}
public int getIsbn() {
	return isbn;
}
public void setIsbn(int isbn) {
	this.isbn = isbn;
}
public int getDealmount() {
	return dealmount;
}
public void setDealmount(int dealmount) {
	this.dealmount = dealmount;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
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
public float getPrice() {
	return price;
}
public void setPrice(float price) {
	this.price = price;
}

 
 
 
}
