package com.spring.helper.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelController {

	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);


	//이벤트 작업 중단 - 유사 기능 존재 
	@RequestMapping("eventculture")
	public String eventculture() throws Exception {
		logger.info("eventculture 로딩 중....");
		return "travel/event/eventculture";
	}
	


}
