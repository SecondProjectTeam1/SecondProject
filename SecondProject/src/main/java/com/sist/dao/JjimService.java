package com.sist.dao;

import java.util.List;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;

@Service
public class JjimService {
	
	@Autowired
	private BookDAO dao;
	
	@Autowired
	private BooksDAO sdao;
	
	@Autowired
	private BookfDAO fdao;
	
	@Autowired
	private VideoDAO vdao;
	
	@Autowired
	private CartDAO cdao;
	
	public List<BookJjimVO> BookJjimListData(String id)
	{
		return dao.BookJjimListData(id);
	}
	
	public List<BookfJjimVO> BookfJjimListData(String id)
	{
		return fdao.BookfJjimListData(id);
	}
	
	public List<BooksJjimVO> BooksJjimListData(String id)
	{
		return sdao.BooksJjimListData(id);
	}
	
	public List<VideoJjimVO> VideoJjimListData(String id)
	{
		return vdao.VideoJjimListData(id);
	}
	
	public BookVO bookDetailData(int no)
	{
		return dao.bookDetailData(no);
	}
	
	public BookfVO bookfDetailData(int no)
	{
		return fdao.bookfDetailData(no);
	}
	
	public BooksVO booksDetailData(int no)
	{
		return sdao.booksDetailData(no);
	}
	
	public VideoVO videoDetailData(int no)
	{
		return vdao.videoDetailData(no);
	}
	
	public int BookJjimCount(String id)
	{
		return dao.BookJjimCount(id);
	}
	
	public int BookfJjimCount(String id)
	{
		return fdao.BookfJjimCount(id);
	}
	
	public int BooksJjimCount(String id)
	{
		return sdao.BooksJjimCount(id);
	}
	public int VideoJjimCount(String id)
	{
		return vdao.VideoJjimCount(id);
	}
	
	/*public List<CartVO> CartListData(String id)
	{
		return cdao.CartListData(id);
	}
	public int CartCount(String id)
	{
		return cdao.CartCount(id);
	}*/
}
