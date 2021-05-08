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

	public String isLogin(String id, String pwd)
	{
		String result="";
		int count=getSqlSession().selectOne("memberIdCount",id);
		if(count==0)
		{
			result="NOID";
		}
		else
		{
			MemberVO vo=getSqlSession().selectOne("memberGetPassword", id);
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
		
}
