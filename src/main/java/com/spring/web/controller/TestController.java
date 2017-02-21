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
		System.out.println("insert 성공:"+res);
		
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
		System.out.println("remove 성공:"+res);
		
		return "redirect:list";
	}

//	@ResponseBody
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
	@ResponseBody
	@RequestMapping(value = "/test", method=RequestMethod.GET)
	public ModelAndView test2() {
		logger.info("home get");
		
		ModelAndView model = new ModelAndView("test");
		return model;
	}
	
	/**
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public ModelAndView test3() {
		logger.info("home get");
		
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	
	/**
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/callBack", method=RequestMethod.GET)
	public ModelAndView test4() {
		logger.info("home get");
		
		ModelAndView model = new ModelAndView("callBack");
		return model;
	}
}
