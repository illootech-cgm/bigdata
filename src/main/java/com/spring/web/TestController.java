package com.spring.web;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	@Resource(name="bbsDao")
	private BbsDao bbsDao;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		logger.info("test controller.......");
		model.addAttribute("data", "메인페이지 입니다.");
		return "test";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Map param) {
		
		ModelMap model = new ModelMap();
	    List<BbsVo> list = bbsDao.boardlistmain();
		
		model.addAttribute("list", list);
		return new ModelAndView("bbs.list",model);
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Model model) {
		
		return "bbs.write";
	}
	
	@RequestMapping(value = "/insert" , method = RequestMethod.POST)
	public String insertEmp(@ModelAttribute BbsVo vo) {
		System.out.println(vo.getEmpno());
		int res=bbsDao.addInfo(vo);
		System.out.println("insert 성공:"+res);
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "/delete" , method = RequestMethod.GET)
	public String deleteEmp(@ModelAttribute BbsVo vo) {
		System.out.println(vo.getEmpno());
		int res=bbsDao.removeInfo(vo.getEmpno());
		System.out.println("remove 성공:"+res);
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model) {
		model.addAttribute("data", "한글되니?");
		return "bbs.view";
	}
}
