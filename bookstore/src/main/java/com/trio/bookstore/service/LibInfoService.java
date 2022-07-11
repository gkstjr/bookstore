package com.trio.bookstore.service;

import java.net.URISyntaxException;

import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.trio.bookstore.vo.LVO;
import com.trio.bookstore.vo.LibInfoVO;
import com.trio.bookstore.vo.LibVO;

public interface LibInfoService {

	LibVO getLibVOData() throws URISyntaxException, JsonMappingException, JsonProcessingException;

	ResponseEntity<LVO> libVO(int number) throws URISyntaxException;

//	ResponseEntity<LibInfoVO> libVO(int number) throws URISyntaxException;

	ResponseEntity<LibInfoVO> libInfoVO(int number)
			throws URISyntaxException, JsonMappingException, JsonProcessingException;

}