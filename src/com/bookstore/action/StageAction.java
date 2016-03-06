package com.bookstore.action;

import java.util.List;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Book;
import com.opensymphony.xwork2.ActionSupport;

public class StageAction extends ActionSupport{
	private static final long serialVersionUID = -506531516183310151L;
	
	private Book book = new Book();
	private BookDao bookDao;
	private List<Book> list;
	
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
	public List<Book> getList() {
		return list;
	}
	public void setList(List<Book> list) {
		this.list = list;
	}
}