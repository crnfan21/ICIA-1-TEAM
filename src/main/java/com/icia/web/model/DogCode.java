package com.icia.web.model;

import java.io.Serializable;

public class DogCode implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String dogMBTI;		//MBTI 코드
	private String dogSpecies;	//견종
	private String dogSize;		//강아지 사이즈(S, M, L)
	private String dogContent;	//강아지 상세설명
	
	public DogCode()
	{
		dogMBTI = "";
		dogSpecies = "";
		dogSize = "";
		dogContent = "";
	}

	public String getDogMBTI() {
		return dogMBTI;
	}

	public void setDogMBTI(String dogMBTI) {
		this.dogMBTI = dogMBTI;
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

}
