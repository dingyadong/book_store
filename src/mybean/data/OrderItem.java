package mybean.data;

public class OrderItem {
	 
    private int id;
    private Book book;
    private int num;
    private Order order;
    
    
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

}
