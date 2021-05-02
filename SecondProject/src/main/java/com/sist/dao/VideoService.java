package com.sist.dao;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;
import java.util.*;

@Service
public class VideoService {
	
	@Resource(name="videoDAO")
	private VideoDAO vDao;
	@Autowired
	private VideoReviewDAO rDao;

	
	// video 정보관련
	public List<VideoVO> viedoListData(Map map)
	{
		return vDao.viedoListData(map);
	}
	public int videoTotalPage(int cno)
	{
		return vDao.videoTotalPage(cno);
	}
	public List<VideoCategoryVO> videoCategoryData()
	{
		return vDao.videoCategoryData();
	}
	public VideoVO videoDetailData(int no)
	{
		return vDao.videoDetailData(no);
	}
	public List<VideoVO> videoSameCategoryData(String category)
	{
		return vDao.videoSameCategoryData(category);
	}
	
	
	// 댓글관련
	public List<VideoReviewVO> videoReviewListData(int vno)
	{
		return rDao.videoReviewListData(vno);
	}
	public void videoReviewInsert(VideoReviewVO vo)
	{
		rDao.videoReviewInsert(vo);
	}
	
}
