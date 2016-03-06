package com.bookstore.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bookstore.entity.Book;

public class BookDaoImpl extends HibernateDaoSupport implements BookDao {

	public void addBook(Book book) {
		super.getHibernateTemplate().save(book);
	}

	public void deleteBook(int id) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Book.class, id));
	}

	public void updateBook(Book book) {
		getHibernateTemplate().update(book);
	}

	@SuppressWarnings("unchecked")
	public List<Book> selectBook() {
		return getHibernateTemplate().find("from Book");
	}
}