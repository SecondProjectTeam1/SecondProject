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
	public List<VideoVO> videoFindData(Map map)
	{
		return vDao.videoFindData(map);
	}
	public int videoFindTotalPage(Map map)
	{
		return vDao.videoFindTotalPage(map);
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
	public void videoReviewUpdate(VideoReviewVO vo)
	{
		rDao.videoReviewUpdate(vo);
	}
	public void videoReviewDelete(int no)
	{
		rDao.videoReviewDelete(no);
	}
	public double starAvgData(int vno)
	{
		return rDao.starAvgData(vno);
	}
	public int revCountData(int vno)
	{
		return rDao.revCountData(vno);
	}
	public List<VideoStarVO> starCount(int vno)
	{
		return rDao.starCount(vno);
	}
	
	public List<VideoJjimVO> VideoJjimListData(String id)
	{
		return vDao.VideoJjimListData(id);
	}
	// 찜개수
	public int VideoJjimCount(String id)
	{
		return vDao.VideoJjimCount(id);
	}
	public int VideoJjimCheck(int cno)
	{
		return vDao.VideoJjimCheck(cno);
	}
	public void VideoJjimInsert(VideoJjimVO vo)
	{
		vDao.VideoJjimInsert(vo);
	}
}
