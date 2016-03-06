package com.bookstore.action;

import java.util.List;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Book;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BackAction extends ActionSupport implements ModelDriven<Book>{
	private static final long serialVersionUID = 2872720748288848515L;
	
	private Book book = new Book();
	private BookDao bookDao;
	private List<Book>list;
	
	public String addBook(){
		book.setCover("123.jpg");
		bookDao.addBook(book);
		return SUCCESS;
	}
	public String updateBook(){
		System.out.println("执行action "+"-------------------->>");
		System.out.println(book.getId()+"++++++++++++++++++>>");
		book.setCover("123.jpg");
		System.out.println(book.getId()+","+book.getName()+"--------------------->>");
		bookDao.updateBook(book);
		return SUCCESS;
	}
	public String deleteBook(){
		bookDao.deleteBook(book.getId());
		return SUCCESS;
	}
	public String findAllBook(){
		list = bookDao.selectBook();
		return SUCCESS;
	}
	
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public BookDao getBookDao() {
		return bookDao;
	}
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public Book getModel() {
		return book;
	}
	public List<Book> getList() {
		return list;
	}
	public void setList(List<Book> list) {
		this.list = list;
	}
	
}