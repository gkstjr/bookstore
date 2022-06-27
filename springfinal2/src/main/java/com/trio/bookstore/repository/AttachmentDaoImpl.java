package com.trio.bookstore.repository;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.trio.bookstore.entity.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {

	@Autowired
	private SqlSession sqlSession;
	
	//저장 위치
	private File directory = new File(System.getProperty("user.home") + "/upload");
	public AttachmentDaoImpl() {
		directory.mkdirs();
	}
	
	/**
	 * 진행 계획
	 * 1. 파일 번호를 생성한다
	 * 2. 실제 파일을 저장한다(파일명은 파일 번호로 처리한다)
	 * 3. DB에 파일 정보를 추가한다
	 * 4. 번호를 반환한다
	 */
	@Override
	public int save(MultipartFile attachment) throws IllegalStateException, IOException {
		//1
		int attachmentNo = sqlSession.selectOne("attachment.sequence");
		
		//2
		String fileName = String.valueOf(attachmentNo);
		File target = new File(directory, fileName);
		attachment.transferTo(target);//저장
		
		//3
		sqlSession.insert("attachment.insert", AttachmentDto.builder()
														.attachmentNo(attachmentNo)
														.attachmentUploadname(attachment.getOriginalFilename())
														.attachmentSavename(fileName)
														.attachmentType(attachment.getContentType())
														.attachmentSize(attachment.getSize())
													.build());
		//4
		return attachmentNo;
	}
	
	@Override
	public AttachmentDto info(int attachmentNo) {
		return sqlSession.selectOne("attachment.one", attachmentNo);
	}
	
	@Override
	public ByteArrayResource load(String attachmentSavename) throws IOException {
		File target = new File(directory, attachmentSavename);
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		return resource;
	}
}

