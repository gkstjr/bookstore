package com.kh.home.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.home.entity.MemberDto;
import com.kh.home.repository.AttachmentDao;
import com.kh.home.repository.MemberDao;
import com.kh.home.repository.MemberProfileDao;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Transactional
	@Override
	public void join(MemberDto memberDto, MultipartFile memberProfile) throws IllegalStateException, IOException {
		memberDao.join(memberDto);
		//프로필 등록 코드 추가(실제 저장 + DB 처리) - Attachment , MemberProfile 테이블
		if(!memberProfile.isEmpty()) {
			int attachmentNo = attachmentDao.save(memberProfile);
			memberProfileDao.insert(memberDto.getMemberId(), attachmentNo);
		}
	}
	
}
