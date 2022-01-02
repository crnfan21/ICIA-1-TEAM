package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.HiBoard;
import com.icia.web.model.HiBoardFile;

@Repository("hiBoardDao")
public interface HiBoardDao 
{
   //21.12.10 게시물 총수 가져오기
   public long boardListCount(HiBoard hiBoard);
   
   //21.12.10 게시물 리스트 조회
   public List<HiBoard> boardList(HiBoard hiBoard);   
   
   //21.12.14 게시물 등록
   //파일첨부없이
   public int boardInsert(HiBoard hiBoard);
   
   //21.12.15 게시물 첨부파일 등록
   public int boardFileInsert(HiBoardFile hiBoardFile); //인서트니까 타입은 int
   
   //21.12.15 게시물 조회
   public HiBoard boardSelect(long hiBbsSeq);
   
   //21.12.15 게시물 조회수 증가 시작
   public int boardReadCntPlus(long hiBbsSeq);
   
   //21.12.15 게시물 첨부파일 조회
   public HiBoardFile boardFileSelect(long hiBbsSeq);
   
   //게시물 삭제시 답변글수 체크
   public int boardAnswersCount(long hiBbsSeq);
   
   //게시물 삭제
   public int boardDelete(long hiBbsSeq);
   
   //게시물 첨부파일 삭제
   public int boardFileDelete(long hiBbsSeq);
   
   //게시물 수정
   public int boardUpdate(HiBoard hiBoard);
   
   //게시물 그룹 순서 변경
   public int boardGroupOrderUpdate(HiBoard hiBoard);
   
   //게시물 답변 등록 시작
   public int boardReplyInsert(HiBoard hiBoard);
   
}