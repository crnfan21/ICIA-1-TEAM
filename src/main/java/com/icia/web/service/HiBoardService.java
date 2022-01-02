package com.icia.web.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.common.util.FileUtil;
import com.icia.web.dao.HiBoardDao;
import com.icia.web.model.HiBoard;
import com.icia.web.model.HiBoardFile;

@Service("HiBoardService")
public class HiBoardService 
{
   private static Logger logger = LoggerFactory.getLogger(HiBoardService.class);
   
   //파일저장 디렉토리 root-context 에 정의되어있는 아이디값임 괄호안에있는거 env 어쩌구 upload.save.dir이거는 env 안에 있는거
   @Value("#{env['upload.save.dir']}")
   private String UPLOAD_SAVE_DIR; //사용할 변수 지정해준다
   
   //하이보드 다오 호출해야하니까 이제 그거 정의하자
   @Autowired
   private HiBoardDao hiBoardDao;
   
   //총게시물 수
   public long boardListCount(HiBoard hiBoard)
   {
      long count = 0;
      try
      {
         count=hiBoardDao.boardListCount(hiBoard);
      }
      catch(Exception e)
      {
         logger.error("[HiBoardService] boardListCount Exception", e);
      }
      return count;
   }
   
   //게시물리스트
   public List<HiBoard> boardList(HiBoard hiBoard)
   {
      List<HiBoard> list = null;
      try
      {
         list=hiBoardDao.boardList(hiBoard);
      }
      catch(Exception e)
      {
         logger.error("[HiBoardService] boardList Exception", e);
      }
      
      return list;
   }
   
   //21.12.14 게시물 등록
   //하이보드는 인서트가 된다, 하이보드파일은 인서트를 하다가 중간에 오류가 났따 -> 통으로 롤백시켜야한다
   //하이보드도 인서트되고, 하이보드파일도 인서트댓으면 -> 같이 커밋을 해야한다
   //그 의미가 트렌지션(?)인데 그거 해볼게요 
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int boardInsert(HiBoard hiBoard) throws Exception //메소드 예외처리 : 나를 호출하는 너가 트라이캐치해라~~~
   {
      //Propagation.REQUIRED : 트랜잭션이 있으면 그 상황에서 실행. 없으면 새로운 트랜잭션 실행(기본설정) 만약에 나를 호출하게전에 다른 곳에 트랜잭션이 있을 수가 있자나? 그러면 그 범위에 같이 속하게끔 하겠다. 없으면 새로만들꺼고요~
      int count = 0;
      
      count = hiBoardDao.boardInsert(hiBoard);
      
      //게시물이 정상적으로 등록되면, 첨부파일이 있다면 첨부파일 등록 /21.12.15
      if(count > 0 && hiBoard.getHiBoardFile() != null) 
      {//초기값을 null을 잡아줬으니까 null과 같지 않으면
         HiBoardFile hiBoardFile = hiBoard.getHiBoardFile(); //주소를 바라보게끔 해주고
         
         hiBoardFile.setHiBbsSeq(hiBoard.getHiBbsSeq()); //매개변수로 받은 하이보드 객체안에 주소값을 바라보고있는데, 이프내의 지역변수인 hiBoardFile도 같은 집 보게해줌 
         hiBoardFile.setFileSeq((short)1); //short타입으로 갈꺼고 강제로 숫자 1걍 넣어준겨
         
        //hiBoardDao.boardFileInsert(hiBoardFile);
         hiBoardDao.boardFileInsert(hiBoard.getHiBoardFile()); //둘이 같은 집을 보고있기 때문에 81번이나 82번이나 같은 뜻이다.
      }
      return count ;
   }
  
   //21.12.15 게시물 보기(파일 포함)
   public HiBoard boardView(long hiBbsSeq)
   {
      HiBoard hiBoard = null;
      
      try 
      {
         hiBoard = hiBoardDao.boardSelect(hiBbsSeq); //이렇게해서 현재값을 가지고 오고
         
         if(hiBoard != null) //널이면  hiBoard = null;란 소리니까 널이 아닐때 처리해야한다
         {
            //조회수 증가
            hiBoardDao.boardReadCntPlus(hiBbsSeq);
            
            HiBoardFile hiBoardFile = hiBoardDao.boardFileSelect(hiBbsSeq); //서비스 호출합니다~ / hiBoard.getHibbsSeq도 사용가능하다
            //HiBoardFile hiBoardFile = hiBoardDao.boardFileSelect(hiBoard.getHiBbsSeq());
            
            if(hiBoardFile != null) 
            {//데이터 조회했더니 있다는 말
               hiBoard.setHiBoardFile(hiBoardFile);
            }
         }
      }
      catch(Exception e)
      {
         logger.error("[HiBoardService] boardView Exception", e);
      }
      
      return hiBoard;
      
   }
   
   //게시물 조회
   public HiBoard boardSelect(long hiBbsSeq)
   {
	   HiBoard hiBoard= null;
	   
	   try
	   {
		   hiBoard = hiBoardDao.boardSelect(hiBbsSeq);
	   }
	   catch(Exception e)
	   {
		   logger.error("[HiBoardService] boardSelect Exception", e);
	   }
	   
	   return hiBoard;
   }
   
   //게시물 삭제시 답변글 수 체크
   public int boardAnswersCount(long hiBbsSeq)
   {
		int count = 0;
		
		try
		{
			count = hiBoardDao.boardAnswersCount(hiBbsSeq);
		}
		catch(Exception e)
		{
			logger.error("[HiBoardService] boardAnswersCount Exception", e);
		}
		
		return count;
   }
   
   //게시물 삭제(첨부파일이 있으면 함께 삭제)
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int boardDelete(long hiBbsSeq) throws Exception
   {
	   int count = 0;
	   
	   HiBoard hiBoard = hiBoardDao.boardSelect(hiBbsSeq);
	   
	   if(hiBoard != null)
	   {
		   HiBoardFile hiBoardFile = hiBoardDao.boardFileSelect(hiBoard.getHiBbsSeq());
		   
		   count = hiBoardDao.boardDelete(hiBbsSeq);
		   
		   if(hiBoardFile != null)
		   {
			   hiBoard.setHiBoardFile(hiBoardFile);
		   
			   if(hiBoardDao.boardFileDelete(hiBbsSeq) > 0)
			   {
				   FileUtil.deleteFile(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + hiBoardFile.getFileName());
			   }
		   }
	   }
	   return count;
   }
   
   //첨부파일 조회
   public HiBoardFile boardFileSelect(long hiBbsSeq)
   {
	   HiBoardFile hiBoardFile = null;
	   
	   try
	   {
		   hiBoardFile = hiBoardDao.boardFileSelect(hiBbsSeq);
	   }
	   catch(Exception e)
	   {
		   logger.error("[HiBoardService] boardFileSelect Exception", e);
	   }
	   
	   return hiBoardFile;
   }
   
   //게시물 폼 수정전 조회시
   public HiBoard boardViewList(long hiBbsSeq)
   {
	   HiBoard hiBoard = null;
	   
	   try
	   {
		   hiBoard = hiBoardDao.boardSelect(hiBbsSeq);
		   
		   if(hiBoard != null)
		   {
			   HiBoardFile hiBoardFile = hiBoardDao.boardFileSelect(hiBbsSeq);
			   
			   if(hiBoardFile != null)
			   {
				   hiBoard.setHiBoardFile(hiBoardFile);
			   }
		   }
	   }
	   catch(Exception e)
	   {
		   logger.error("[HiBoardService] boardViewList Exception", e);
	   }
	   
	   
	   return hiBoard;
   }
   
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int boardUpdate(HiBoard hiBoard) throws Exception
   {
	   int count = 0;
	   count = hiBoardDao.boardUpdate(hiBoard);
	   
	   if(count > 0 && hiBoard.getHiBoardFile() != null)
	   {
		   HiBoardFile delHiBoardFile = hiBoardDao.boardFileSelect(hiBoard.getHiBbsSeq());
		   
		   if(delHiBoardFile != null)
		   {
			   FileUtil.deleteFile(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + delHiBoardFile.getFileName());
			   
			   hiBoardDao.boardFileDelete(hiBoard.getHiBbsSeq());
		   }
		   
		   HiBoardFile hiBoardFile = hiBoard.getHiBoardFile();
		   hiBoardFile.setHiBbsSeq(hiBoard.getHiBbsSeq());
		   hiBoardFile.setFileSeq((short)1);
		   
		   hiBoardDao.boardFileInsert(hiBoard.getHiBoardFile());
	   }
	   
	   
	   return count;
   }
   
   //첨부파일 삭제=================================================================================================================
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int boardFileDelete(HiBoard hiBoard) throws Exception
   {
	   int count = 0;
	   
	   if(hiBoard.getHiBoardFile() != null)
	   {
		   HiBoardFile delHiBoardFile = hiBoardDao.boardFileSelect(hiBoard.getHiBbsSeq());
		   
		   if(delHiBoardFile != null)
		   {
			   FileUtil.deleteFile(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + delHiBoardFile.getFileName());
			   
			  count = hiBoardDao.boardFileDelete(hiBoard.getHiBbsSeq());
		   }
	   }
	   return count;
   }
   //==========================================================================================================================
   //답글 등록 처리
   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
   public int boardReplyInsert(HiBoard hiBoard) throws Exception
   {
	   int count = 0;
	   
	   hiBoardDao.boardGroupOrderUpdate(hiBoard);
	   
	   count = hiBoardDao.boardReplyInsert(hiBoard);
	   
	   if(count > 0 && hiBoard.getHiBoardFile() != null)
	   {
		   HiBoardFile hiBoardFile = hiBoard.getHiBoardFile();
		   
		   hiBoardFile.setHiBbsSeq(hiBoard.getHiBbsSeq());
		   hiBoardFile.setFileSeq((short)1);
		   
		   hiBoardDao.boardFileInsert(hiBoardFile);
	   }
	   
	   return count;
   }
} 