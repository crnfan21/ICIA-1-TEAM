package com.icia.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icia.common.util.StringUtil;
import com.icia.web.model.Donation;
import com.icia.web.model.Paging;
import com.icia.web.model.Purchase;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.DonationService;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;

@Controller("donationController")
public class DonationController {
   private static Logger logger = LoggerFactory.getLogger(DonationController.class);

   // 쿠키명
   @Value("#{env['auth.cookie.name']}")
   private String AUTH_COOKIE_NAME;

   // 파일저장경로
   @Value("#{env['upload.save.dir']}")
   private String UPLOAD_SAVE_DIR;

   @Autowired
   private DonationService donationservice;

   @Autowired
   private UserService userService;

   private static final int LIST_COUNT = 6; // 한페이지의 게시물 수
   private static final int PAGE_COUNT = 5; // 페이징 수

   @RequestMapping(value = "/Donation/DonationI", method = RequestMethod.GET)
   public String DonationI(HttpServletRequest request, HttpServletResponse response) {
      return "/Donation/DonationI";
   }

   @RequestMapping(value = "/Donation/Dmade")
   public String Dmade(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
      String searchType1 = HttpUtil.get(request, "searchType1");
      String searchType2 = HttpUtil.get(request, "searchType2");
      long pdsSeq = HttpUtil.get(request, "pdsSeq", (long) 0);

      long curPage = HttpUtil.get(request, "curPage", (long) 1); // 없을 때는 0 처리

      long totalCount = 0;

      List<Donation> list = null;

      Paging paging = null;

      Donation search = new Donation();

      if (!StringUtil.isEmpty(searchType1)) {
         search.setSearhType1(searchType1);
      } else {
         searchType1 = "";
      }

      if (!StringUtil.isEmpty(searchType2)) {
         search.setSearhType2(searchType2);
      } else {
         searchType2 = "";
      }

      totalCount = donationservice.productListCount(search);

      logger.debug("totalCount : " + totalCount);

      if (totalCount > 0) {
         paging = new Paging("/Donation/Dmade", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");

         paging.addParam("searchType1", searchType1);
         paging.addParam("searchType2", searchType2);
         paging.addParam("curPage", curPage);

         search.setStartRow(paging.getStartRow());
         search.setEndRow(paging.getEndRow());

         list = donationservice.productList(search);
      }

      model.addAttribute("list", list);
      model.addAttribute("searchType1", searchType1);
      model.addAttribute("searchType2", searchType2);
      model.addAttribute("curPage", curPage);
      model.addAttribute("paging", paging);

      return "/Donation/Dmade";

   }

   @RequestMapping(value = "/Donation/single")
   public String single(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
      long pdsSeq = HttpUtil.get(request, "pdsSeq", (long) 0);

      logger.debug("=====pdsSeq===== : " + pdsSeq);


      Donation donation = null;

      if (pdsSeq > 0) {
         donation = donationservice.productSelect(pdsSeq);
      }

      model.addAttribute("pdsSeq", pdsSeq);
      model.addAttribute("donation", donation);


      return "/Donation/single";

   }

   @RequestMapping(value = "/Donation/orderForm", method = RequestMethod.POST)
   public String orderForm(ModelMap model, HttpServletRequest request, HttpServletResponse response) 
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      int pdsSeq = HttpUtil.get(request, "pdsSeq", (int) 0);
      Donation donation = null;

      
      User user = userService.userSelect(cookieUserId);

      if (user != null) 
      {
         if(pdsSeq>0)
         {
            donation= donationservice.productSelect(pdsSeq);
         }
         
         model.addAttribute("donation", donation);
         model.addAttribute("user", user);
      
         return "/Donation/orderForm";

      }

      else 
      {
         return "/user/loginJoin";
      }

   }
   
   @RequestMapping(value="/Donation/orderCheck")
   public String orderCheck(ModelMap model, HttpServletRequest request, HttpServletResponse response)
   {
      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      int pdsSeq = HttpUtil.get(request, "pdsSeq", (int) 0);
      int pdsStock = HttpUtil.get(request, "pdsStock", (int) 1);
      int pdsPrice = HttpUtil.get(request, "pdsPrice", (int)1);
      String sample3postcode  = HttpUtil.get(request, "sample3postcode", "");
      String sample3address   = HttpUtil.get(request, "sample3address", "");
      String sample3detailAddress  = HttpUtil.get(request, "sample3detailAddress", "");
      
      String pdsAddress = sample3postcode+" "+sample3address+" "+sample3detailAddress;
      
      Donation donation = null;

      logger.debug("=====pdsAddress===== : " + pdsAddress);
      logger.debug("=====sample3_postcode===== : " + sample3postcode);
      logger.debug("=====sample3_address===== : " + sample3address);
      logger.debug("=====sample3_detailAddress===== : " + sample3detailAddress);
      
      
      User user = userService.userSelect(cookieUserId);
      
      if (user != null) 
      {
         if(pdsSeq>0)
         {
            donation= donationservice.productSelect(pdsSeq);
         }
         
         model.addAttribute("donation", donation);
         model.addAttribute("user", user);
         model.addAttribute("pdsStock", pdsStock);
         model.addAttribute("pdsPrice", pdsPrice);
         model.addAttribute("pdsAddress", pdsAddress);
      

      }
      
      return "/Donation/orderCheck";
   }
   
   @RequestMapping(value="/Donation/orderProc", method=RequestMethod.POST)
   @ResponseBody
   public Response<Object> orderProc(HttpServletRequest request, HttpServletResponse response)
   {
      Response<Object> ajax = new Response<Object>();
      
      String cookieUserId =CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
      
      long pdsSeq = HttpUtil.get(request, "pdsSeq", (long)0);
      String pcsAddress = HttpUtil.get(request, "pcsAddress", "");
      long pcsStock = HttpUtil.get(request, "pcsStock", (long)0);
      long pcsAmount = HttpUtil.get(request, "pcsAmount", (long)0);
      long pcsRAmount = HttpUtil.get(request, "pcsRAmount", (long)0);
      long pcsPoint = HttpUtil.get(request, "pcsPoint", (long)0);
      
      if(pdsSeq>0)
      {
         Donation donation = donationservice.productSelect(pdsSeq);
         
         if(donation != null)
         {
            Purchase purchase = new Purchase();
            purchase.setUserId(cookieUserId);
            purchase.setPcsAddress(pcsAddress);
            purchase.setPcsAmount(pcsAmount);
            purchase.setPcsPoint(pcsPoint);
            purchase.setPcsStock(pcsStock);
            purchase.setPcsRAmount(pcsRAmount);
            purchase.setPdsSeq(pdsSeq);
            
            if(donationservice.productInsert(purchase)>0)
            {
               ajax.setResponse(0, "success");
            }
            else
            {
               ajax.setResponse(100, "Bad");
            }
         }
         else
         {
            ajax.setResponse(100, "Bad");
         }
      }
      else
      {
         ajax.setResponse(100, "Bad");
      }
      
      return ajax;
   }
}