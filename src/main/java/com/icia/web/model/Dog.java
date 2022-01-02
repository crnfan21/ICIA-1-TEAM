package com.icia.web.model;

import java.io.Serializable;

public class Dog implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int dogSeq;			//강아지 번호
	private String dogName;		//강아지명
	private String dogGender;	//성별(M, F)
	private String dogMBTI;		//MBTI코드
	private String entDate;		//입소일
	private String adtDate;		//입양일
	private String neutering;	//중성화여부(Y, N)
	private String dogSig;		//특이사항
	private String dogMainImg;	//메인 이미지(Y, N)
	private String dogSubImg1;	//서브 이미지1(Y, N)
	private String dogSubImg2;	//서브 이미지2(Y, N)
	private String dogSubImg3;	//서브 이미지3(Y, N)
	private String dogSpecies;	//견종
	private String dogSize;		//강아지 사이즈(S, M, L)
	private String dogContent;	//강아지 상세설명
	
	private String searchType;		//검색타입(1:이름, 2:제목, 3:내용)
	private String searchValue;		//검색 값
	
	private long startRow;			//시작 rownum
	private long endRow;			//끝 rownum
	
	
	public Dog()
	{
		dogSeq = 0;
		dogName = "";
		dogGender = "";
		dogMBTI = "";
		entDate = "";
		adtDate = "";
		neutering = "";
		dogSig = "";
		dogMainImg = "";
		dogSubImg1 = "";
		dogSubImg2 = "";
		dogSubImg3 = "";
		dogSpecies = "";
		dogSize = "";
		dogContent = "";
		
		searchType = "";
		searchValue = "";
		
		startRow = 0;
		endRow = 0;
	}

	public int getDogSeq() {
		return dogSeq;
	}

	public void setDogSeq(int dogSeq) {
		this.dogSeq = dogSeq;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getDogGender() {
		return dogGender;
	}

	public void setDogGender(String dogGender) {
		this.dogGender = dogGender;
	}

	public String getDogMBTI() {
		return dogMBTI;
	}

	public void setDogMBTI(String dogMBTI) {
		this.dogMBTI = dogMBTI;
	}

	public String getEntDate() {
		return entDate;
	}

	public void setEntDate(String entDate) {
		this.entDate = entDate;
	}

	public String getAdtDate() {
		return adtDate;
	}

	public void setAdtDate(String adtDate) {
		this.adtDate = adtDate;
	}

	public String getNeutering() {
		return neutering;
	}

	public void setNeutering(String neutering) {
		this.neutering = neutering;
	}

	public String getDogSig() {
		return dogSig;
	}

	public void setDogSig(String dogSig) {
		this.dogSig = dogSig;
	}

	public String getDogMainImg() {
		return dogMainImg;
	}

	public void setDogMainImg(String dogMainImg) {
		this.dogMainImg = dogMainImg;
	}

	public String getDogSubImg1() {
		return dogSubImg1;
	}

	public void setDogSubImg1(String dogSubImg1) {
		this.dogSubImg1 = dogSubImg1;
	}

	public String getDogSubImg2() {
		return dogSubImg2;
	}

	public void setDogSubImg2(String dogSubImg2) {
		this.dogSubImg2 = dogSubImg2;
	}

	public String getDogSubImg3() {
		return dogSubImg3;
	}

	public void setDogSubImg3(String dogSubImg3) {
		this.dogSubImg3 = dogSubImg3;
	}
	
	public String getDogSpecies() {
		return dogSpecies;
	}

	public void setDogSpecies(String dogSpecies) {
		this.dogSpecies = dogSpecies;
	}

	public String getDogSize() {
		return dogSize;
	}

	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}

	public String getDogContent() {
		return dogContent;
	}

	public void setDogContent(String dogContent) {
		this.dogContent = dogContent;
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public long getStartRow() {
		return startRow;
	}

	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}

	public long getEndRow() {
		return endRow;
	}

	public void setEndRow(long endRow) {
		this.endRow = endRow;
	}
}
