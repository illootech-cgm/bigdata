package com.spring.web;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<BbsVo> boardlistmain() {
		System.out.println("*************DAO**********************");
		
		return sqlSession.selectList("springtest.listAll");
	}
	
	public int addInfo(BbsVo vo){
		int res=sqlSession.insert("springtest.insert");
		return res;
	}
	
	
}
