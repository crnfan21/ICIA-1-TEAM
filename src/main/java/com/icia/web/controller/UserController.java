/**
 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.controller
 * 파일명     : UserController.java
 * 작성일     : 2021. 1. 20.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.web.controller;

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

import com.google.gson.JsonObject;
import com.icia.common.util.StringUtil;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;
import com.icia.web.util.JsonUtil;

/**
 * <pre>
 * 패키지명   : com.icia.web.controller
 * 파일명     : UserController.java
 * 작성일     : 2021. 1. 20.
 * 작성자     : daekk
 * 설명       : 사용자 컨트롤러
 * </pre>
 */
@Controller("userController")
public class UserController
{
   private static Logger logger = LoggerFactory.getLogger(UserController.class);
   
   // 쿠키명
   @Value("#{env['auth.cookie.name']}") //"#{env['auth.cookie.name']}" 값을 AUTH_COOKIE_NAME에 넣을거야
   private String AUTH_COOKIE_NAME; //USER_ID랑 짝꿍 env.xml의
   
   @Autowired
   private UserService userService;
   
   
   //★★로그인창 띄우기
   @RequestMapping(value = "/user/loginJoin", method=RequestMethod.GET)
   public String loginJoin(HttpServletRequest request, HttpServletResponse response)
   {
      return "/user/loginJoin";
   }

   
   //★★로그인 유무
   @RequestMapping(value="/user/login", method=RequestMethod.POST) 
   @ResponseBody 
   public Response<Object> login(HttpServletRequest request, HttpServletResponse response)
   {
      String userId = HttpUtil.get(request, "userId");
      String userPwd = HttpUtil.get(request, "userPwd");
      Response<Object> ajaxResponse = new Response<Object>();
      
      if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))
      {
         User user = userService.userSelect(userId);
         
         if(user != null)
         {
            if(StringUtil.equals(user.getUserPwd(), userPwd))
            {
               if(StringUtil.equals(user.getStatus(), "Y"))
               {
                  CookieUtil.addCookie(response, "/", -1, AUTH_COOKIE_NAME, CookieUtil.stringToHex(userId));               
                  ajaxResponse.setResponse(0, "Success"); // 로그인 성공
               }
               else
               {
                  ajaxResponse.setResponse(403, "Not Found"); // 사용자 정보 없음 (Not Found)
               }
            }
            else
            {
               ajaxResponse.setResponse(-1, "Passwords do not match"); // 비밀번호 불일치
            }
         }
         else
         {
            ajaxResponse.setResponse(404, "Not Found"); // 사용자 정보 없음 (Not Found)
         }
      }
      else
      {
         ajaxResponse.setResponse(400, "Bad Request"); // 파라미터가 올바르지 않음 (Bad Request)
      }
      
      if(logger.isDebugEnabled())
      {
         logger.debug("[UserController] /user/login response\n" + JsonUtil.toJsonPretty(ajaxResponse));
      }
      
      return ajaxResponse;
   }
   
   
      //★★즁복아이디체크
      @RequestMapping(value="/user/idCheck", method=RequestMethod.POST)
      @ResponseBody //내꺼에서 바로 Response보낼거라서 ResponseBody 사용함
      public Response<Object> idCheck(HttpServletRequest request, HttpServletResponse response)
      {
         String userId = HttpUtil.get(request, "userId");
         Response<Object> ajaxResponse = new Response<Object>();
         
         if(!StringUtil.isEmpty(userId)) //매개변수로 넘어왔냐 ?, 아이디 넘어왔냐 확인
         {
            if(userService.userSelect(userId) == null) //객체가 생성되지 않았다==데이터가 없다==아이디가없다, //userService == bin
            {
               ajaxResponse.setResponse(0, "Success");
            }
            else
            {
               ajaxResponse.setResponse(100, "Duplicate ID");
            }
         }
         else
         {
            ajaxResponse.setResponse(400, "Bad Request");
         }
               
         return ajaxResponse;
      }
      
      
      //★★회원가입 폼
    @RequestMapping(value="/user/regForm", method=RequestMethod.GET) 
     public String regForm(HttpServletRequest request, HttpServletResponse response) 
     {
       
       String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
         
       if(StringUtil.isEmpty(cookieUserId)) 
       {
          return "/user/regForm";
       }
       else 
       {
          CookieUtil.deleteCookie(request, response, AUTH_COOKIE_NAME); 
            
          return "redirect:/"; 
       }
      }
      
    
    //★★실제 회원가입
      @RequestMapping(value="/user/regProc", method=RequestMethod.POST)
      @ResponseBody 
      public Response<Object> regProc(HttpServletRequest request, HttpServletResponse response)
      {
         Response<Object> ajaxResponse = new Response<Object>();
         String userId = HttpUtil.get(request, "userId");
         String userPwd = HttpUtil.get(request, "userPwd");
         String userName = HttpUtil.get(request, "userName");
         String userEmail = HttpUtil.get(request, "userEmail");
         String regDate = HttpUtil.get(request, "regdate");
         String userAddress = HttpUtil.get(request, "userAddress");
         String userPNum = HttpUtil.get(request, "userPNum");
         String dogSeqList = HttpUtil.get(request, "dogSeqList");
         String userBDate = HttpUtil.get(request, "userBDate");
         String userNName = HttpUtil.get(request, "userNName");

       
      
      if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName) && !StringUtil.isEmpty(userEmail))
      {
         if(userService.userSelect(userId)==null)
         {
            User user = new User();
            user.setUserId(userId);
            user.setUserPwd(userPwd);
            user.setUserName(userName);
            user.setUserEmail(userEmail);
            user.setStatus("Y");
            user.setRegDate(regDate);
            user.setUserAddress(userAddress);
            user.setUserPNum(userPNum);
            user.setDogSeqList(dogSeqList);
            user.setUserBDate(userBDate);
            user.setUserNName(userNName);
            user.setUserGrade("N");
            user.setUserPoint(2000);
            
            if(userService.userInsert(user)>0) 
            {
               ajaxResponse.setResponse(0, "Susccess");
            }
            else
            {//비정상
               ajaxResponse.setResponse(500, "Internal Server Error");
            }
         }
         else
         {//중복 아이디라는 뜻. 중복오류코드는 100번으로 집어넣자고요
            ajaxResponse.setResponse(100, "Duplicate Id");
         }
      }
      else
      {
         ajaxResponse.setResponse(400, "Bad Request");
         }
         
         return ajaxResponse;
      }    
    
      //★★로그아웃
      @RequestMapping(value="/user/loginOut", method=RequestMethod.GET)
      public String loginOut(HttpServletRequest request, HttpServletResponse response)
      {
         if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
         {
            CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
         }
         return "redirect:/";
      }
      
      
      //★★마이페이지 띄우기
      @RequestMapping(value = "/user/myPage", method=RequestMethod.GET)
      public String myPage(ModelMap model, HttpServletRequest request, HttpServletResponse response)
      {
         String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

         User user = userService.userSelect(cookieUserId);
         
         model.addAttribute("user", user);
         
         return "/user/myPage";
      }
      
      //★★ 회원정보수정 창띄우기
         @RequestMapping(value="/user/updateForm", method=RequestMethod.GET)
         public String updateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
         {
            String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
            
            User user = userService.userSelect(cookieUserId); //유저객체에 현재 갖고있는 유저정보를 읽어왔어요
            
            model.addAttribute("user", user); // 나는 "user"라는 jsp에서 사용할 이름을 쓸거야, 메소드에 정의되어있는 user라는 객체를
            
            return "/user/updateForm";
         }
         
         //★★회원정보 수정
         @RequestMapping(value="/user/updateProc", method=RequestMethod.POST)
         @ResponseBody
         public Response<Object> updateProc(HttpServletRequest request, HttpServletResponse response)
         {
            Response<Object> ajaxResponse = new Response<Object>();
            String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
            String userId = HttpUtil.get(request, "userId");
            String userPwd = HttpUtil.get(request, "userPwd");
            String userName = HttpUtil.get(request, "userName");
            String userEmail = HttpUtil.get(request, "userEmail");
            String regDate = HttpUtil.get(request, "regdate");
            String userAddress = HttpUtil.get(request, "userAddress");
            String userPNum = HttpUtil.get(request, "userPNum");
            String dogSeqList = HttpUtil.get(request, "dogSeqList");
            String userBDate = HttpUtil.get(request, "userBDate");
            String userNName = HttpUtil.get(request, "userNName");
            
            if(!StringUtil.isEmpty(cookieUserId))
            {//일단 주소를 바로 치고들어오는경우도 있기 때문에~
               User user = userService.userSelect(cookieUserId); //그래서 이걸로 정보일단 조회할거야
               
               if(user != null)
               {//status가 y일때 수정할 수 있자나
                 if(StringUtil.equals(user.getStatus(), "Y")) 
                 {//회원정보수정도 사용하고 있는 회원이기 때문에 Y 스테터스 확인해주는겨
                    if(!StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName) && !StringUtil.isEmpty(userEmail))
                    {//입력값이 빠진거 없이 null없이 잘 들어갔니?
                       //이제 유저객체에 값을 넣어줘야함. 현재까지는 DB에있는 값만 불러온듯
                       user.setUserName(userName);
                       user.setUserPwd(userPwd);
                       user.setUserEmail(userEmail);
                       user.setUserAddress(userAddress);
                       user.setUserPNum(userPNum);
                       user.setUserBDate(userBDate);
                       user.setUserNName(userNName);
                       
                       
                       if(userService.userUpdate(user)>0)
                       {//그리고나서 업데이트구문 날려주면 끝~! / 0보다 큰게 정상적으로 처리된거
                          ajaxResponse.setResponse(0, "Success");  //우리 정상처리는 걍 코드값 0으로 해줬엇자나 
                       }
                       else
                       {
                          ajaxResponse.setResponse(500, "internal server error");
                       }
                    }
                    else
                    {
                       CookieUtil.deleteCookie(request, response, AUTH_COOKIE_NAME);
                       ajaxResponse.setResponse(400, "Bad Request");                    
                    }        
                 }
                 else
                 {//문제있는 회원
                    CookieUtil.deleteCookie(request, response, AUTH_COOKIE_NAME);
                    ajaxResponse.setResponse(400, "Bad Request");
                 }
               }
               else
               {
                  CookieUtil.deleteCookie(request, response, AUTH_COOKIE_NAME);
                  ajaxResponse.setResponse(404, "Not Found. 회원이없다고요");
               }
            }
            else
            {//로그인된정보가 아니겠지~?
               ajaxResponse.setResponse(400, "Bad Request");
            }
            

            return ajaxResponse;
         }
         
         //★★입양신청 현황 띄우기
         @RequestMapping(value = "/user/adoptNow", method=RequestMethod.GET)
         public String adoptNow(HttpServletRequest request, HttpServletResponse response)
         {
            return "/user/adoptNow";
         }         
         
}