package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Repository
public class MemberDAO extends SqlSessionDaoSupport{

	@Autowired
	@Qualifier("ssf")
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	/*public String isLogin(String id, String pwd)
	{
		String result="";
		MemberVO vo = new MemberVO();
		int count=getSqlSession().selectOne("memberIdCount",id);
		if(count==0)
		{
			result="NOID";
		}
		else
		{
			vo=getSqlSession().selectOne("memberGetPassword", id);
			String dbPwd=vo.getPwd();
			String name=vo.getName();
			
			
			if(dbPwd.equals(pwd))
			{
				result=name;
			}
			else
			{
				result="NOPWD";
			}
		}
		return result;
	}*/
	
	public MemberVO isLogin(String id, String pwd)
	{
		
		MemberVO vo = new MemberVO();
		int count=getSqlSession().selectOne("memberIdCount",id);
		if(count==0)
		{
			vo.setMsg("NOID");
		}
		else
		{
			vo=getSqlSession().selectOne("memberGetPassword", id);
			String dbPwd=vo.getPwd();
			//String name=vo.getName();
			
			if(dbPwd.equals(pwd))
			{
				vo.setMsg("OK");
			}
			else
			{
				vo.setMsg("NOPWD");
			}
		}
		return vo;
	}
	
	public int idCheck(String id)
	{
		
		int idCount=getSqlSession().selectOne("memberIdCount",id);
		
		
		return idCount;
	}
	
	public List<ZipcodeVO> signUpAddress(String dong)
	{
		return getSqlSession().selectList("signUpAddress",dong);
	}
	
	public void memberJoin(MemberVO vo)
	{
		getSqlSession().insert("insertMember",vo);
	}
	
	public List<MemberVO> memberSearch(Map map)
	{
		return getSqlSession().selectList("memberFindData",map);
	}
	
	public void memberDelete(String id)
	{
		getSqlSession().delete("memberDelete",id);
	}
	public MemberVO MemberAllData(String id)
	{
		return getSqlSession().selectOne("MemberAllData", id);
	}
	public void MypageUpdateData(MemberVO vo)
	{
		getSqlSession().update("MypageUpdateData",vo);
	}
	public void MemberContentsCheck(Map map)
	{
		getSqlSession().insert("MemberContentsCheck",map);
	}
	public List<MemberVO> userCheckedData(Map map)
	{
		return getSqlSession().selectList("userCheckedData",map);
	}
	public int usersLike(String id)
	{
		return getSqlSession().selectOne("recomToMain",id);
	}
	
	public List<VideoVO> mainedVideoData(int cno)
	{
		return getSqlSession().selectList("mainedVideoData",cno);
	}
}
