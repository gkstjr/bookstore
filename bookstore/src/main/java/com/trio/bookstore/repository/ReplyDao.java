package com.trio.bookstore.repository;

import java.util.List;

import com.trio.bookstore.entity.ReplyDto;

public interface ReplyDao {
	ReplyDto insert(ReplyDto replyDto);
	List<ReplyDto> list(int replyTarget);
	void delete(int replyNo);
	ReplyDto edit(ReplyDto replyDto);
	void calculateReplyCount(int replyTarget);
}
