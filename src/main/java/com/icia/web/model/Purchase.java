package com.icia.web.model;

import java.io.Serializable;

public class Purchase  implements Serializable
{
   private static final long serialVersionUID = 1L;
   
   private long pcsSeq;
   private long pcsStock;
   private String userId;
   private long pcsAmount;
   private long pcsRAmount;
   private long pcsPoint;;
   private String pcsDate;
   private long pdsSeq;
   private long pcsStatus;
   private String pcsAddress;
   
   public Purchase()
   {
      pcsSeq=0;
      pcsStock=0;
      userId="";
      pcsAmount=0;
      pcsRAmount=0;
      pcsPoint=0;
      pcsDate="";
      pdsSeq=0;
      pcsStatus=0;
      pcsAddress="";
   }

   public long getPcsSeq() {
      return pcsSeq;
   }

   public void setPcsSeq(long pcsSeq) {
      this.pcsSeq = pcsSeq;
   }

   public long getPcsStock() {
      return pcsStock;
   }

   public void setPcsStock(long pcsStock) {
      this.pcsStock = pcsStock;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public long getPcsAmount() {
      return pcsAmount;
   }

   public void setPcsAmount(long pcsAmount) {
      this.pcsAmount = pcsAmount;
   }

   public long getPcsRAmount() {
      return pcsRAmount;
   }

   public void setPcsRAmount(long pcsRAmount) {
      this.pcsRAmount = pcsRAmount;
   }

   public long getPcsPoint() {
      return pcsPoint;
   }

   public void setPcsPoint(long pcsPoint) {
      this.pcsPoint = pcsPoint;
   }

   public String getPcsDate() {
      return pcsDate;
   }

   public void setPcsDate(String pcsDate) {
      this.pcsDate = pcsDate;
   }

   public long getPdsSeq() {
      return pdsSeq;
   }

   public void setPdsSeq(long pdsSeq) {
      this.pdsSeq = pdsSeq;
   }

   public long getPcsStatus() {
      return pcsStatus;
   }

   public void setPcsStatus(long pcsStatus) {
      this.pcsStatus = pcsStatus;
   }

   public String getPcsAddress() {
      return pcsAddress;
   }

   public void setPcsAddress(String pcsAddress) {
      this.pcsAddress = pcsAddress;
   }
   
   
   
   
}

