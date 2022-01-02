package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.web.dao.DonationDao;
import com.icia.web.model.Donation;
import com.icia.web.model.Purchase;

@Service("DonationService")
public class DonationService {
   private static Logger logger = LoggerFactory.getLogger(DonationService.class);
   
   @Value("#{env['upload.save.dir']}")
   private String UPLOAD_SAVE_DIR;
   
   @Autowired
   private DonationDao donationDao;
   
   public long productListCount(Donation donation)
   {
      long count=0;
      try
      {
         count = donationDao.productListCount(donation);
      }
      catch(Exception e)
      {
         logger.error("[DonationService] productListCount Exception", e);
      }
      return count;
   }
   
   public List<Donation> productList(Donation donation)
   {
      List<Donation> list = null;
      
      try
      {
         list=donationDao.productList(donation);
      }
      catch(Exception e)
      {
         logger.error("[DonationService] productList Exception", e);
      }
      
      return list;
   }
   
   public Donation productSelect(long pdsSeq)
   {
      Donation donation = null;
      
      try
      {
         donation =donationDao.productSelect(pdsSeq);
      }
      catch(Exception e)
      {
         logger.error("[DonationService] productSelect Exception", e);
      }
      
      return donation;
   }
   
   
   public int productInsert(Purchase purchase) 
   {
      int count=0;
      
      try
      {
         count=donationDao.productInsert(purchase);
      }
      catch(Exception e)
      {
         logger.error("[DonationService] productInsert Exception", e);
      }
      
      return count;
   }
}