package com.icia.web.model;

import java.io.Serializable;

public class Adopt implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private long adtSeq;			//입양신청 번호
	private String userId;			//사용자 아이디
	private long dogSeq;			//강아지 번호
	private String adtPeriod;		//입양 고민기간
	private String adtReason;		//입양 이유
	private String adtHome;			//주거 형태
	private String adpAgree;		//동의여부
	private String adtPet;			//반려동물
	private String regDate;			//등록일
	private String adtStatus;		//신청상태
	
	public Adopt()
	{
		adtSeq = 0;
		userId = "";
		dogSeq = 0;
		adtPeriod = "";
		adtReason = "";
		adtHome = "";
		adpAgree = "";
		adtPet ="";
		regDate= "";
		adtStatus = "";
	}

	public long getAdtSeq() {
		return adtSeq;
	}

	public void setAdtSeq(long adtSeq) {
		this.adtSeq = adtSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getDogSeq() {
		return dogSeq;
	}

	public void setDogSeq(long dogSeq) {
		this.dogSeq = dogSeq;
	}

	public String getAdtPeriod() {
		return adtPeriod;
	}

	public void setAdtPeriod(String adtPeriod) {
		this.adtPeriod = adtPeriod;
	}

	public String getAdtReason() {
		return adtReason;
	}

	public void setAdtReason(String adtReason) {
		this.adtReason = adtReason;
	}

	public String getAdtHome() {
		return adtHome;
	}

	public void setAdtHome(String adtHome) {
		this.adtHome = adtHome;
	}

	public String getAdpAgree() {
		return adpAgree;
	}

	public void setAdpAgree(String adpAgree) {
		this.adpAgree = adpAgree;
	}

	public String getAdtPet() {
		return adtPet;
	}

	public void setAdtPet(String adtPet) {
		this.adtPet = adtPet;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getAdtStatus() {
		return adtStatus;
	}

	public void setAdtStatus(String adtStatus) {
		this.adtStatus = adtStatus;
	}
}
