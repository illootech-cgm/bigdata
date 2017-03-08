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
	public ModelAndView test() {
		logger.info("home get");
		
		ModelAndView model = new ModelAndView("home");
		return model;
	}
	
	/**
	 * @return
	 */
	@RequestMapping(value = "/homePost")
	public ModelAndView testPost() {
		logger.info("home");
		
	    List<BbsVo> list = bbsDao.boardlistmain();
		HashMap map = new HashMap();
		map.put("rows", list);
		
		ModelAndView model = new ModelAndView("jsonView", map);
		return model;
	}
	
	/**
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Map param) {
		
		ModelMap model = new ModelMap();
	    List<BbsVo> list = bbsDao.boardlistmain();
		
		model.addAttribute("list", list);
		return new ModelAndView("bbs.list",model);
	}
	
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
	@RequestMapping(value = "/delete" , method = RequestMethod.GET)
	public String deleteEmp(@ModelAttribute BbsVo vo) {
		System.out.println(vo.getEmpno());
		int res=bbsDao.removeInfo(vo.getEmpno());
		System.out.println("remove ����:"+res);
		
		return "redirect:list";
	}

	@RequestMapping(value = "/view")
	public ModelAndView view(String empno) {
		System.out.println(empno);

	    BbsVo bbsvo = bbsDao.detailInfo(empno);
		
	    List<BbsVo> list = new ArrayList();
	    
	    list.add(bbsvo);
	    
		HashMap map = new HashMap();
		map.put("rows", list);
		
		ModelAndView model = new ModelAndView("jsonView", map);
		System.out.println(bbsvo.getDeptno());
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
	   @RequestMapping(value = "/owner/addMenu", method=RequestMethod.POST)
	   public ModelAndView ownerAddMenuPOST(@ModelAttribute menuVo mVo) {
		   logger.info("ownerAddMenuPOST");
		   System.out.println(mVo.getMenuCode());
		   System.out.println(mVo.getMenuName());
		   System.out.println(mVo.getMenuPrice());
		   System.out.println(mVo.getStoreCode());
		   System.out.println(mVo.getMenuPicture());
		   bbsDao.addMenu(mVo);
		   ModelMap model = new ModelMap();
		   List<menuVo> list = bbsDao.menuList(mVo.getStoreCode());
		   model.addAttribute("menuList",list);
		   
		   ModelAndView mv = new ModelAndView("/owner/menuList",model);
		   return mv;
	   }
	   
	   @RequestMapping(value = "/owner/regStore", method=RequestMethod.GET)
	   public ModelAndView ownerRegister() {
		   logger.info("ownerRegister");
		   ModelAndView model = new ModelAndView("/owner/regStore");
		   return model;
	   }
	   
	   @RequestMapping(value = "/owner/regStore", method=RequestMethod.POST)
	   public ModelAndView ownerRegStorePOST(@ModelAttribute storeVo mVo) {
		   logger.info("ownerRegStorePOST");
		   bbsDao.regStore(mVo);
		   
		   
		   ModelAndView model = new ModelAndView("/owner/choice");
		   return model;
	   }
	   
}





