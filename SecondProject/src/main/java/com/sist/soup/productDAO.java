package com.sist.soup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.sist.jdbc.*;

public class productDAO {
	private DAOManager dm = new DAOManager();
	private Connection conn;
	private PreparedStatement ps;
	public void productInsert(productVO vo) {
		 try {
			 conn=dm.getConnection();
			 /*
			 NO           NOT NULL NUMBER         
			 CNO          NOT NULL NUMBER         
			 TITLE        NOT NULL VARCHAR2(400)  
			 SUBTITLE              VARCHAR2(400)  
			 POSTER                VARCHAR2(1000) 
			 AUTHOR                VARCHAR2(400)  
			 PUDATE                VARCHAR2(200)  
			 PUBLISHER             VARCHAR2(200)  
			 PRICE                 VARCHAR2(200)  
			 BOOKPAGE              VARCHAR2(200)  
			 BOOK_INFO             CLOB           
			 CONTENT_LIST          CLOB           
			 DETAIL_IMAGE          VARCHAR2(1000) 
			 AUTHOR_INFO           CLOB           
			 SCORE                 VARCHAR2(200)  
			 STOCK                 NUMBER       
			  */
			 String sql="INSERT INTO book(no,title,subtitle,poster,author,pudate,publisher,"
			 		+ "price,bookpage,book_info,content_list,detail_image,author_info,score,stock,cno,link) "
			 		+ "VALUES((SELECT NVL(MAX(no)+1,1) FROM book),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			 ps=conn.prepareStatement(sql);
			 ps.setString(1, vo.getTitle());
			 ps.setString(2, vo.getSubtitle());
			 ps.setString(3, vo.getPoster());
			 ps.setString(4, vo.getAuthor());
			 ps.setString(5, vo.getPubdate());
			 ps.setString(6, vo.getPublisher());
			 ps.setString(7, vo.getPrice());
			 ps.setString(8, vo.getBookpage());
			 ps.setString(9, vo.getBookinfo());
			 ps.setString(10, vo.getContentlist());
			 ps.setString(11, vo.getDetailimg());
			 ps.setString(12, vo.getAuthinfo());
			 ps.setString(13, vo.getScore());
			 ps.setInt(14, vo.getStock());
			 ps.setInt(15, vo.getCno());
			 ps.setString(16, vo.getLink());
			 ps.executeUpdate(); 
		 }catch(Exception ex) {
			 ex.printStackTrace();
		 } finally {
			 dm.disConnection(conn, ps);
		 }
	 }
}
