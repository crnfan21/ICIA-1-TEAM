package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.web.dao.AdoptDao;
import com.icia.web.model.Adopt;
import com.icia.web.model.Dog;

@Service("adoptService")
public class AdoptService 
{
	private static Logger logger = LoggerFactory.getLogger(AdoptService.class);
	
	//파일 저장 디렉토리
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Autowired
	private AdoptDao adoptDao;
	
	//총 강아지 수
	public long dogListCount(Dog dog)
	{
		long count = 0;
		
		try
		{
			count = adoptDao.dogListCount(dog);
		}
		catch(Exception e)
		{
			logger.error("[AdoptService] dogListCount Exception", e);
		}
		
		return count;
	}
	
	//강아지 리스트
	public List<Dog> dogList(Dog dog)
	{
		List<Dog> list = null;
		
		try
		{
			list = adoptDao.dogList(dog);
		}
		catch(Exception e)
		{
			logger.error("[AdoptService] dogList Exception", e);
		}
		
		return list;
	}
	
	//강아지 보기
	public Dog dogView(long dogSeq)
	{
		Dog dog = null;
		
		try
		{
			dog = adoptDao.dogSelect(dogSeq);
			
		}
		catch(Exception e)
		{
			logger.error("[AdoptService] dogView Exception", e);
		}
		
		return dog;
	}
	
	//강아지 선택
	public Dog dogSelect(int dogSeq)
	{
		Dog dog = null;
		
		try
		{
			dog = adoptDao.dogSelect(dogSeq);
		}
		catch(Exception e)
		{
			logger.error("[AdoptService] dogSelect Exception", e);
		}
		
		return dog;
	}
	
	//입양신청 등록
	public int adoptInsert(Adopt adopt)
	{
		int count = 0;
		
		try
		{
			count = adoptDao.adoptInsert(adopt);
		}
		catch(Exception e)
		{
			logger.error("[AdoptService] adoptInsert Exception", e);
		}
		
		return count;
	}
	
	//강아지 번호 선택
	public long dogSeqSelect(Dog dog)
	{
		long count = 0;
		
		try
		{
			count = adoptDao.dogSeqSelect(dog);
		}
		catch(Exception e)
		{
			logger.error("[AdoptService] dogSeqSelect Exception", e);
		}
		
		return count;
	}
	
	//강아지 등록
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int dogInsert(Dog dog) throws Exception
	{
		int count = 0;
		
		count = adoptDao.dogInsert(dog);
		
		return count;
	}
}
