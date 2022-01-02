package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.Adopt;
import com.icia.web.model.Dog;

@Repository("adoptDao")
public interface AdoptDao 
{
	//강아지 총 수
	public long dogListCount(Dog dog);
	
	//강아지 리스트
	public List<Dog> dogList(Dog dog);
	
	//강아지 조회
	public Dog dogSelect(long dogSeq);
	
	//입양신청 등록
	public int adoptInsert(Adopt adopt);
	
	//강아지 번호 선택
	public long dogSeqSelect(Dog dog);
	
	//강아지 등록
	public int dogInsert(Dog dog);
}
