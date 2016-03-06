package com.bookstore.util;

import java.util.List;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Book;

public class Test {
	public static void main(String[] args) {
//		updateDatabase();
		handleDao();
	}

	private void updateDatabase() {
		// 读取配置文件
		Configuration cf = new Configuration().configure();

		// 生成数据库
		// 数据库设计方案
		SchemaExport export = new SchemaExport(cf);

		// 1.是否显示SQL
		// 2.是否覆盖原有数据库
		export.create(true, true);
	}

	private static void handleDao() {
		BeanFactory beanFactory = new ClassPathXmlApplicationContext(
				"applicationContext*.xml");
		BookDao bookDao = (BookDao) beanFactory.getBean("bookDao");
		Book book = new Book();
		book.setCover("book_01.jpg");
		book.setName("基督山伯爵");
		book.setAuthor("大仲马");
		book.setPress("人民文学出版社");
		book.setIsbn("123456789");
		book.setNumber(1000);
		book.setPrice(98.9);
		bookDao.addBook(book);
//		book.setId(4);
//		book.setName("1");
//		bookDao.updateBook(book);
		List<Book>list = bookDao.selectBook();
		for(Book b : list){
			System.out.println(b.getName());
		}
	}
}