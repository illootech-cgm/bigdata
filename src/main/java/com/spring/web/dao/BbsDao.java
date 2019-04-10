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
	
	public List<BbsVo> boardlistmain(BbsVo vo) {
		
		return sqlSession.selectList("springtest.listAll",vo);
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
	
	public List<BbsVo> detailInfo(BbsVo vo) {
//		System.out.println(sqlSession.selectOne("springtest.detailInfo"));
		return sqlSession.selectList("springtest.detailInfo", vo);
	}
	public List<BbsVo> clsHistInfo(BbsVo vo) {
//		System.out.println(sqlSession.selectOne("springtest.detailInfo"));
		return sqlSession.selectList("springtest.clsHistInfo", vo);
	}
	
	public List<BbsVo> buyHistInfo(BbsVo vo) {
//		System.out.println(sqlSession.selectOne("springtest.detailInfo"));
		return sqlSession.selectList("springtest.buyHistInfo", vo);
	}
	public int addMenu(BbsVo mvo){
		
//		int isExt = sqlSession.selectOne("springtest.extMenu",mvo);
//		if(isExt > 0){
//			System.out.println("해당메뉴가 이미 존재함");
//			return 0;
//		}
//		else{
		int res = sqlSession.insert("springtest.addMenu",mvo);
		System.out.println(res+"건 추가완료");
		return res;
//		}
	}
	
	public List<menuVo> menuList(String storeCode) {
		return sqlSession.selectList("springtest.menuList",storeCode);
	}
	
	
	
	
	public int regStore(storeVo mvo){
			
	//		int isExt = sqlSession.selectOne("springtest.extStore",mvo);
	//		if(isExt > 0){
	//			System.out.println("해당메뉴가 이미 존재함");
	//			return 0;
	//		}
	//		else{
	//		int res = sqlSession.insert("springtest.regStore",mvo);
	//		System.out.println(res+"건 추가완료");
	//		return res;
	//		}
	//	}
		int res = sqlSession.insert("springtest.regStore",mvo);
//		int res2 = sqlSession.insert("springtest.regBuyHist",mvo); 결제내역
		System.out.println(res+"건 추가완료");
		return res;
	}
	
	public int uptStore(storeVo mvo){
		
		//		int isExt = sqlSession.selectOne("springtest.extStore",mvo);
		//		if(isExt > 0){
		//			System.out.println("해당메뉴가 이미 존재함");
		//			return 0;
		//		}
		//		else{
		//		int res = sqlSession.insert("springtest.regStore",mvo);
		//		System.out.println(res+"건 추가완료");
		//		return res;
		//		}
		//	}
			int res = sqlSession.insert("springtest.uptStore",mvo);
			System.out.println(res+"건 추가완료");
			return res;
		}
}
