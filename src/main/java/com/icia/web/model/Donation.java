package com.icia.web.model;

import java.io.Serializable;

public class Donation implements Serializable
{
   private static final long serialVersionUID = 1L;
   
   private long pdsSeq;
   private long pdsStock;
   private long pdsPrice;
   private String pdsName;
   private String pdsSize;
   private String pdsMainImg;
   private String pdsSubImg1;
   private String pdsSubImg2;
   private String pdsSumbImg3;
   
   private String pdsType;
   private String searchType1;
   private String searchType2;
   
   private long startRow;
   private long endRow;
   
   private String userId;
   

   
   public Donation()
   {
      pdsSeq=0;
      pdsStock=0;
      pdsPrice=0;
      pdsName="";
      pdsSize="";
      pdsMainImg="";
      pdsSubImg1="";
      pdsSubImg2="";
      pdsSumbImg3="";
      searchType1="";
      searchType2="";
      startRow=0;
      endRow=0;
      pdsType="";
      userId="";
      
   }


   public long getPdsSeq() {
      return pdsSeq;
   }


   public void setPdsSeq(long pdsSeq) {
      this.pdsSeq = pdsSeq;
   }


   public long getPdsStock() {
      return pdsStock;
   }


   public void setPdsStock(long pdsStock) {
      this.pdsStock = pdsStock;
   }


   public long getPdsPrice() {
      return pdsPrice;
   }


   public void setPdsPrice(long pdsPrice) {
      this.pdsPrice = pdsPrice;
   }


   public String getPdsName() {
      return pdsName;
   }


   public void setPdsName(String pdsName) {
      this.pdsName = pdsName;
   }


   public String getPdsSize() {
      return pdsSize;
   }


   public void setPdsSize(String pdsSize) {
      this.pdsSize = pdsSize;
   }


   public String getPdsMainImg() {
      return pdsMainImg;
   }


   public void setPdsMainImg(String pdsMainImg) {
      this.pdsMainImg = pdsMainImg;
   }


   public String getPdsSubImg1() {
      return pdsSubImg1;
   }


   public void setPdsSubImg1(String pdsSubImg1) {
      this.pdsSubImg1 = pdsSubImg1;
   }


   public String getPdsSubImg2() {
      return pdsSubImg2;
   }


   public void setPdsSubImg2(String pdsSubImg2) {
      this.pdsSubImg2 = pdsSubImg2;
   }


   public String getPdsSumbImg3() {
      return pdsSumbImg3;
   }


   public void setPdsSumbImg3(String pdsSumbImg3) {
      this.pdsSumbImg3 = pdsSumbImg3;
   }


   public String getPdsType() {
      return pdsType;
   }


   public void setPdsType(String pdsType) {
      this.pdsType = pdsType;
   }


   public String getSearhType1() {
      return searchType1;
   }


   public void setSearhType1(String searhType1) {
      this.searchType1 = searhType1;
   }


   public String getSearhType2() {
      return searchType2;
   }


   public void setSearhType2(String searhType2) {
      this.searchType2 = searhType2;
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


   public String getUserId() {
      return userId;
   }


   public void setUserId(String userId) {
      this.userId = userId;
   }

   

   
}