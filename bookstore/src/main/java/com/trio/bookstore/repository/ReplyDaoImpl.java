package com.trio.bookstore.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.ReplyDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
//	@Transactional
	public ReplyDto insert(ReplyDto replyDto) {
		int replyNo = sqlSession.selectOne("reply.sequence");
		replyDto.setReplyNo(replyNo);
		sqlSession.insert("reply.insert", replyDto);
		this.calculateReplyCount(replyDto.getReplyTarget());
		return sqlSession.selectOne("reply.one", replyNo);
	}
	
	@Override
	public List<ReplyDto> list(int replyTarget) {
		return sqlSession.selectList("reply.list", replyTarget);
	}

	@Override
//	@Transactional
	public void delete(int replyNo) {
		ReplyDto replyDto = sqlSession.selectOne("reply.one", replyNo);
		int count = sqlSession.delete("reply.delete", replyNo);
		if(count == 0) throw new CannotFindException();
		this.calculateReplyCount(replyDto.getReplyTarget());
	}
	
	@Override
	public ReplyDto edit(ReplyDto replyDto) {
		int count = sqlSession.update("reply.edit", replyDto);
		if(count == 0) throw new CannotFindException();
		return sqlSession.selectOne("reply.one", replyDto.getReplyNo());
	}
	
	@Override
	public void calculateReplyCount(int replyTarget) {
		sqlSession.update("reply.calculateReplyCount", replyTarget);
	}
}



