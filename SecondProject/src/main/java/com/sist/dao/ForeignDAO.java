package com.sist.dao;
import java.sql.*;
import java.util.*;


import com.sist.jdbc.*;
import com.sist.vo.ForeignVO;

public class ForeignDAO {
	private DAOManager dm=new DAOManager();
	private Connection conn;
	private PreparedStatement ps;
	public void ForeignInsert(ForeignVO vo)
	{
		try
		{
			conn=dm.getConnection();
			String sql="INSERT INTO book_f VALUES("
					  +"(SELECT NVL(MAX(no)+1,1) FROM book_f),?,?,?,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, vo.getCno());
			ps.setString(2, vo.getCategory());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getPoster());
			ps.setString(5, vo.getAuthor());
			ps.setString(6, vo.getPudate());
			ps.setString(7, vo.getPublisher());
			ps.setString(8, vo.getPrice());
			ps.setString(9, vo.getBookpage());
			//ps.setString(10, vo.getBook_info());
			ps.setString(10, vo.getScore());
			ps.setString(11, vo.getLink());
			ps.setString(12, vo.getSubtitle());
			ps.executeUpdate(); // COMMIT
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dm.disConnection(conn, ps);
		}
	}
}