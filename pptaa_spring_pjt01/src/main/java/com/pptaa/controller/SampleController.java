package com.pptaa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pptaa.domain.SampleDTO;
import com.pptaa.domain.SampleDTOLIst;
import com.pptaa.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
//	}
	
	
	@RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
	public void basicGet() {
		log.info("basic get post");
	}
	@GetMapping(value = "/basiconlyget")
	public void basicGet2() {
		log.info("basic only get");
	}
	
	@GetMapping(value = "/ex01")
	public String ex01(SampleDTO dto) {
		log.info(""+ dto);
		return "ex01";
	}
	
	
	@GetMapping(value = "/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
		log.info("name: "+ name);
		log.info("age: "+ age);
		return "ex02";
	}
	
	@GetMapping(value = "/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids: "+ ids);
		return "ex02List";
	}
	
	@GetMapping(value = "/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {
		log.info("ids: "+ Arrays.toString(ids));
		return "ex02Array";
	}
	
	@GetMapping(value = "/ex02Bean")
	public String ex02Bean(SampleDTOLIst list) {
		log.info("list: "+ list);
		return "ex02Bean";
	}
	
	@GetMapping("ex03")
	public String ex03(TodoDTO todoDTO) {
		log.info("todo: "+ todoDTO);
		return "ex03";
	}
	
	@GetMapping("ex04")
	public String ex04(SampleDTO dto,@ModelAttribute("page") int page) {
		
		log.info("dto: "+ dto);
		log.info("page"+page);
		
		return "/sample/ex04";
	}
	
	@GetMapping(value = "/ex05")
	public void ex05() {
		log.info("/ex05.....");
	}
	
	@GetMapping(value = "/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("/ex06.....");
		
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("Tomson");
		
		
		return dto;
	}
	
	@GetMapping(value = "/ex07")
	public ResponseEntity<String> ex07() {
		log.info("/ex07.....");
		
		String msg = "{\"name\": \"가나다\"}";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg, headers, HttpStatus.OK);
	}
	
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("exUpload........");
	}
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		log.info("exUploadPost........");
		
		files.forEach(file -> {
			log.info("------------------------");
			log.info("name : " + file.getOriginalFilename());
			log.info("size : " + file.getSize());
		});
	}

}
