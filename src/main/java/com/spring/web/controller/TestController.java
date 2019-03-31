package com.spring.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.web.dao.BbsDao;
import com.spring.web.vo.BbsVo;
import com.spring.web.vo.menuVo;
import com.spring.web.vo.storeVo;

@Controller
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	@Resource(name="bbsDao")
	private BbsDao bbsDao;
	
	/**
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/home", method=RequestMethod.GET)
	public ModelAndView test(BbsVo vo) {
		logger.info("home get");
		List<BbsVo> list = bbsDao.boardlistmain(vo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println(list.get(i).getCstnm());
			System.out.println(list.get(i).getCst_phn_no());
			System.out.println(list.get(i).getIdno() );
		}
		
		ModelAndView model = new ModelAndView("home", map);
		return model;
	}
	@RequestMapping(value = "/home", method=RequestMethod.POST)
	public ModelAndView testHomePost(BbsVo vo) {
		logger.info("home get");
		List<BbsVo> list = bbsDao.boardlistmain(vo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println(list.get(i).getCstnm());
			System.out.println(list.get(i).getCst_phn_no());
			System.out.println(list.get(i).getIdno() );
		}
		
		ModelAndView model = new ModelAndView("home", map);
		return model;
	}
	/**
	 * @return
	 */
	@RequestMapping(value = "/homePost", method=RequestMethod.GET)
	public ModelAndView testGet(BbsVo vo) {
		logger.info("home");
		
	    List<BbsVo> list = bbsDao.boardlistmain(vo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println(list.get(i).getCstnm());
			System.out.println(list.get(i).getCst_phn_no());
			System.out.println(list.get(i).getIdno() );
		}
		
		ModelAndView model = new ModelAndView("home", map);
		return model;
	}
	/**
	 * @return
	 */
	@RequestMapping(value = "/homePost", method=RequestMethod.POST)
	public ModelAndView testPost(BbsVo vo) {
		logger.info("homePost POST");
		
	    List<BbsVo> list = bbsDao.boardlistmain(vo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println("homePost POST");
			System.out.println(list.get(i).getCstnm());
			System.out.println(list.get(i).getCst_phn_no());
			System.out.println(list.get(i).getIdno() );
		}
		
		ModelAndView model = new ModelAndView("jsonView", map);
		return model;
	}
	
//	/**
//	 * @param param
//	 * @return
//	 */
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public ModelAndView list(Map param) {
//		
//		ModelMap model = new ModelMap();
//	    List<BbsVo> list = bbsDao.boardlistmain(vo);
//		
//		model.addAttribute("list", list);
//		return new ModelAndView("bbs.list",model);
//	}
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Model model) {
		
		return "bbs.write";
	}
	
	/**
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/insert")
	public String insertEmp(@ModelAttribute BbsVo vo) {
		System.out.println(vo.getEmpno());
		int res=bbsDao.addInfo(vo);
		System.out.println("insert ����:"+res);
		
		return "redirect:list";
	}
	
	/**
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/delete" , method = RequestMethod.POST)
	public String deleteEmp(@ModelAttribute BbsVo vo) {
		System.out.println(vo.getCstno());
		int res=bbsDao.removeInfo(vo.getCstno());
		
		return "redirect:home";
	}

	@RequestMapping(value = "/view")
	public ModelAndView view(String schd_dt, String edu_subject) {

//	    BbsVo bbsvo = bbsDao.detailInfo(empno);
		
//	    List<BbsVo> list = new ArrayList();
	    
//	    list.add(bbsvo);
	    
//		HashMap map = new HashMap();
//		map.put("rows", list);
		
//		ModelAndView model = new ModelAndView("jsonView", map);
//		System.out.println(bbsvo.getDeptno());
		
		BbsVo bbsvo = new BbsVo();
		bbsvo.setEdu_dt(schd_dt);
		bbsvo.setEdu_subject(edu_subject);
		List<BbsVo> list = bbsDao.detailInfo(bbsvo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println("view");
			System.out.println(list.get(i).getEdu_dt());
			System.out.println(list.get(i).getEdu_strt_tm());
			System.out.println(list.get(i).getEdu_dt());
		}
		
//		System.out.println(map.get("rows").toString());
	    return new ModelAndView("jsonView",map);
		
	}
	
	@RequestMapping(value = "/clsHist")
	public ModelAndView clsHist(String cstno) {

		BbsVo bbsvo = new BbsVo();
		bbsvo.setCstno(cstno);
		bbsvo.setLssn_attnd_yn("Y");
		List<BbsVo> list = bbsDao.clsHistInfo(bbsvo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println("view");
			System.out.println(list.get(i).getEdu_dt());
			System.out.println(list.get(i).getEdu_strt_tm());
			System.out.println(list.get(i).getEdu_dt());
		}
		
//		System.out.println(map.get("rows").toString());
	    return new ModelAndView("jsonView",map);
		
	}
	@RequestMapping(value = "/reserveHist")
	public ModelAndView reserveHist(String cstno) {

		BbsVo bbsvo = new BbsVo();
		bbsvo.setCstno(cstno);
		bbsvo.setLssn_attnd_yn("N");
		List<BbsVo> list = bbsDao.clsHistInfo(bbsvo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println("view");
			System.out.println(list.get(i).getEdu_dt());
			System.out.println(list.get(i).getEdu_strt_tm());
			System.out.println(list.get(i).getEdu_dt());
		}
		
//		System.out.println(map.get("rows").toString());
	    return new ModelAndView("jsonView",map);
		
	}
	@RequestMapping(value = "/buyHist")
	public ModelAndView buyHist(String cstno) {

		BbsVo bbsvo = new BbsVo();
		bbsvo.setCstno(cstno);
		List<BbsVo> list = bbsDao.clsHistInfo(bbsvo);
		HashMap map = new HashMap();
		map.put("rows", list);
		for(int i = 0 ; i < list.size() ; i++ ) {
			System.out.println("view");
			System.out.println(list.get(i).getEdu_dt());
			System.out.println(list.get(i).getEdu_strt_tm());
			System.out.println(list.get(i).getEdu_dt());
		}
		
//		System.out.println(map.get("rows").toString());
	    return new ModelAndView("jsonView",map);
		
	}
	/**
	 * @return
	 */
	@RequestMapping(value = "/test", method=RequestMethod.GET)
	public ModelAndView test2() {
		logger.info("home get");
		
		ModelAndView model = new ModelAndView("test");
		return model;
	}
	
	/**
	 * @return
	 */
	@RequestMapping(value = "/comm/login", method=RequestMethod.GET)
	public ModelAndView test3() {
		logger.info("home get");
		
		ModelAndView model = new ModelAndView("/comm/login");
		return model;
	}
	
	/**
	 * @return
	 */
	@RequestMapping(value = "/comm/main", method=RequestMethod.GET)
	public ModelAndView main() {
		logger.info("main get");
		
		ModelAndView model = new ModelAndView("/comm/main");
		return model;
	}
	
	/**
	 * @return
	 */
	@RequestMapping(value = "/comm/callBack", method=RequestMethod.GET)
	public ModelAndView test4() {
		logger.info("home get");
		
		ModelAndView model = new ModelAndView("/comm/callBack");
		return model;
	}

	   /**
	    * @return
	    */
	   @RequestMapping(value = "/guest/choice")
	   public ModelAndView choice() {
	      logger.info("home get");
	      
	      ModelAndView model = new ModelAndView("/guest/choice");
	      return model;
	   }
	   
	   /**
	    * @return
	    */
	   @RequestMapping(value = "/guest/order", method=RequestMethod.GET)
	   public ModelAndView order() {
	      logger.info("home get");
	      
	      ModelAndView model = new ModelAndView("/guest/order");
	      return model;
	   }
	   
	   /**
	    * @return
	    */
	   @RequestMapping(value = "/owner/choice")
	   public ModelAndView ownerChoice() {
	      logger.info("home get");
	      
	      ModelAndView model = new ModelAndView("/owner/choice");
	      return model;
	   }
	   
	   /**
	    * @return
	    */
	   @RequestMapping(value = "/owner/order", method=RequestMethod.GET)
	   public ModelAndView ownerOrder() {
	      logger.info("home get");
	      
	      ModelAndView model = new ModelAndView("/owner/order");
	      return model;
	   }
	   /**
	    * @return
	    */
	   @RequestMapping(value = "/owner/addMenu", method=RequestMethod.GET)
	   public ModelAndView ownerAddMenu() {
		   logger.info("ownerAddMenu");
		   
		   ModelAndView model = new ModelAndView("/owner/addMenu");
		   return model;
	   }
	   /**
	    * @return
	    */
	   @RequestMapping(value = "/comm/addMenu", method=RequestMethod.POST)
	   public ModelAndView ownerAddMenuPOST(@ModelAttribute BbsVo mVo) {
		   logger.info("ownerAddMenuPOST");
		   bbsDao.addMenu(mVo);
		   ModelMap model = new ModelMap();
//		   List<menuVo> list = bbsDao.menuList(mVo);
//		   model.addAttribute("menuList",list);
		   
		   ModelAndView mv = new ModelAndView("/comm/main",model);
		   return mv;
	   }
	   
	   @RequestMapping(value = "/owner/regStore", method=RequestMethod.GET)
	   public ModelAndView ownerRegister() {
		   logger.info("ownerRegister");
		   ModelAndView model = new ModelAndView("/owner/regStore");
		   return model;
	   }
	   
	   @RequestMapping(value = "/owner/menuList", method=RequestMethod.GET)
	   public ModelAndView ownerMenuList() {
		   logger.info("ownerMenuList");
		   ModelMap model = new ModelMap();
		   List<menuVo> list = bbsDao.menuList("1"); // login 정보에서 획득해야함 (storeCode)
		   model.addAttribute("menuList", list);
		   ModelAndView mv = new ModelAndView("/owner/menuList",model);
		   return mv;
	   }
	   
	   @RequestMapping(value = "/owner/uptStore", method=RequestMethod.POST)
	   public ModelAndView owneruptStorePOST(@ModelAttribute storeVo mVo) {
		   logger.info("ownerRegStorePOST");
		   bbsDao.uptStore(mVo);
		   
		   ModelAndView model = new ModelAndView("/home");
		   return model;
	   }
	   
	   @RequestMapping(value = "/owner/regStore", method=RequestMethod.POST)
	   public ModelAndView ownerRegStorePOST(@ModelAttribute storeVo mVo) {
		   logger.info("ownerRegStorePOST");
		   bbsDao.regStore(mVo);
		   
		   ModelAndView model = new ModelAndView("/home");
		   return model;
	   }
	   @RequestMapping(value = "/owner/regTable", method=RequestMethod.GET)
	   public ModelAndView ownerRegTablePOST(@ModelAttribute storeVo mVo) {
		   logger.info("ownerRegTablePOST");
//		   bbsDao.regTable(mVo);
		   
		   ModelAndView model = new ModelAndView("/owner/regTable");
		   return model;
	   }
	   
}
