package com.bookstore.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Book;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BackAction extends ActionSupport implements ModelDriven<Book>{
	private static final long serialVersionUID = 2872720748288848515L;
	
	private Book book = new Book();
	private BookDao bookDao;
	private List<Book>list;
//	
	private static final int BUFFER_SIZE = 16 * 1024;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String savePath;
	
	public String addBook(){
		Date date = new Date();
		StringBuffer str = new StringBuffer();
		str.append(date.getTime());
		str.append(".");
		str.append(this.uploadFileName.substring(this.uploadFileName.lastIndexOf(".")+1));
		String dstPath = ServletActionContext.getServletContext().getRealPath(this.getSavePath())+"//"+str.toString();
		File dstFile = new File(dstPath);
		copy(this.upload,dstFile);
		
		book.setCover(str.toString());
		bookDao.addBook(book);
		return SUCCESS;
	}
	public String updateBook(){
		book.setCover("123.jpg");
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
	
	private static void copy(File src,File dst){
		InputStream in = null;
		OutputStream out = null;
		try{
			in = new BufferedInputStream(new FileInputStream(src),BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while((len = in.read(buffer)) > 0){
				out.write(buffer, 0, len);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(null != in){
				try{
					in.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			if(null != out){
				try{
					out.close();
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
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
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public static int getBufferSize() {
		return BUFFER_SIZE;
	}
	
}