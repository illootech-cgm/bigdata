package com.spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.BbsVo;

@Repository
public class BbsDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<BbsVo> boardlistmain() {
		return sqlSession.selectList("springtest.listAll");
	}
	
	public int addInfo(BbsVo vo){
		int res=sqlSession.insert("springtest.insert",vo);
		System.out.println(res+"건 추가 완료");
		return res;
	}
	
	public int removeInfo(String empno){
		int res=sqlSession.delete("springtest.delete",empno);
		System.out.println(res+"건 삭제 완료");
		return res;
	}
	
	public BbsVo detailInfo(String empno) {
		System.out.println(empno);
//		System.out.println(sqlSession.selectOne("springtest.detailInfo"));
		return sqlSession.selectOne("springtest.detailInfo", empno);
	}
}
