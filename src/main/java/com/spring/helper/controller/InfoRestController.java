package com.spring.helper.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.helper.method.method.GetJsonData;

@RestController
public class InfoRestController {

	private static final Logger logger = LoggerFactory.getLogger(InfoRestController.class);

	@Autowired
	GetJsonData getJson;
	
	
	@RequestMapping(value="getNewsJson", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getNewsJson(HttpServletRequest req, Model model) throws Exception {
		logger.info("getNewsJson 로딩 중....");
		String ctrcode = req.getParameter("ctrcode");
		logger.info(ctrcode);
		ResponseEntity<Map<String,Object>> entity = null;
		getJson.getNewsJson(ctrcode);
		return entity;
	};

}
