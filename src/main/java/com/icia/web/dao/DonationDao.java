package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.Donation;
import com.icia.web.model.Purchase;

@Repository("donationDao")
public interface DonationDao 
{
   public List<Donation> productList(Donation donation);
   public long productListCount(Donation donation);
   public Donation productSelect(long pdsSeq);
   public int productInsert(Purchase purchase);
}