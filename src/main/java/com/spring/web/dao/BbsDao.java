package com.spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.BbsVo;
import com.spring.web.vo.menuVo;
import com.spring.web.vo.storeVo;

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
	
	public int addMenu(menuVo mvo){
		
		int isExt = sqlSession.selectOne("springtest.extMenu",mvo);
		if(isExt > 0){
			System.out.println("해당메뉴가 이미 존재함");
			return 0;
		}
		else{
		int res = sqlSession.insert("springtest.addMenu",mvo);
		System.out.println(res+"건 추가완료");
		return res;
		}
	}
	
	public List<menuVo> menuList(String storeCode) {
		return sqlSession.selectList("springtest.menuList",storeCode);
	}
	
	
	
	
public int regStore(storeVo mvo){
		
		int isExt = sqlSession.selectOne("springtest.extStore",mvo);
		if(isExt > 0){
			System.out.println("해당메뉴가 이미 존재함");
			return 0;
		}
		else{
		int res = sqlSession.insert("springtest.regStore",mvo);
		System.out.println(res+"건 추가완료");
		return res;
		}
	}
	
	
}
