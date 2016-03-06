package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Book;

public interface BookDao {
	public void addBook(Book book);

	public void deleteBook(int id);
	
	public void updateBook(Book book);
	
	public List<Book> selectBook();
	
}