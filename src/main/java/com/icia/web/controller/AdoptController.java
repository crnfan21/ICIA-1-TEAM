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

import com.icia.common.model.FileData;
import com.icia.common.util.StringUtil;
import com.icia.web.model.Adopt;
import com.icia.web.model.Dog;
import com.icia.web.model.Paging;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.AdoptService;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;

@Controller("AdoptController")
public class AdoptController 
{
	private static Logger logger = LoggerFactory.getLogger(AdoptController.class);
	
	//쿠키명
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	//파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	//강아지 사진 저장 경로
	@Value("#{env['upload.dog.save.dir']}")
	private String UPLOAD_DOG_SAVE_DIR;
	
	@Autowired
	private AdoptService adoptService;
	
	@Autowired
	private UserService userService;
	
	private static final int LIST_COUNT = 6;		//한 페이지의 게시물 수
	private static final int PAGE_COUNT = 5;		//페이징 수
	
	
	@RequestMapping(value = "/adopt/dogList")
	public String dogList(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		//조회항목(1:성별, 2:견종, 3:사이즈)
		String searchType = HttpUtil.get(request, "searchType", "");
		//조회값
		String searchValue = HttpUtil.get(request, "searchValue", "");
		
		//현재 페이지
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		//게시글 수를 담기 위한 객체
		long totalCount = 0;
		//리스트에 띄울 내용을 HiBoard로 받기 위한 게시물 리스트 객체
		List<Dog> list = null;
		//페이징 객체
		Paging paging = null;
		//조회 객체
		Dog search = new Dog();
		
		//관리자 여부
		User user = null;
		
		//view에서 넘어온 searchType과 searchValue과 값이 있는지 확인하여 있으면 조회 객체에 값을 넣어줌
		if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
		{
			search.setSearchType(searchType);
			search.setSearchValue(searchValue);
		}
		else	//없으면 그냥 ""처리
		{
			searchType = "";
			searchValue = "";
		}
		
		//서비스에 생성한 조회객체를 넘겨서 게시글 수 조회(여기서 만약 searchType과 searchValue가 없다면 전체 게시글 수, 있다면 해당 타입과 밸류에 맞는 게시글 수만 조회)
		totalCount = adoptService.dogListCount(search);
		
		logger.debug("totalCount : " + totalCount);
		
		//실제 게시물이 존재할때
		if(totalCount > 0)
		{
			//페이징 처리 추가, 객체 생성시 생성자를 통해 페이징 처리까지 수행
			paging = new Paging("/adopt/dogList", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			paging.addParam("searchType", searchType);
			paging.addParam("searchValue", searchValue);
			paging.addParam("curPage", curPage);
			
			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());
			
			//실제 각 게시물 별 정보를 담은 Dog 객체를 list 객체에 담음
			list = adoptService.dogList(search);
			
			user = userService.userSelect(cookieUserId);
		}
		
		logger.debug("list : " + list);
		
		//view 페이지로 넘길때 이용할 수 있게 각 키별로 값을 담아줌
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		model.addAttribute("user", user);
		
		return "/adopt/dogList";
	}
	
	//강아지 상세 조회
	@RequestMapping(value="/adopt/dogView")
	public String dogView(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		//String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long dogSeq = HttpUtil.get(request, "dogSeq", (long)0);
		
		Dog dog = null;
		
		//실제 존재하는 게시글일 경우(hiBbsSeq는 시퀀스를 통해 인서트할때 넣어줬기 때문에 0보다 작을 수 없다)
		if(dogSeq > 0)
		{
			//해당 Seq값으로 게시글 조회
			dog = adoptService.dogView(dogSeq);
		}
		
		model.addAttribute("dogSeq", dogSeq);
		model.addAttribute("dog", dog);
		//model.addAttribute("boardMe", boardMe);
		
		return "/adopt/dogView";
	}
	
	//입양신청 폼
	@RequestMapping(value="/adopt/dogAdopt", method=RequestMethod.POST)
	public String dogAdopt(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{		
		//쿠키값
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		int dogSeq = HttpUtil.get(request, "dogSeq", (int)0);
		
		Dog dog = null;
		
		//쿠키 정보를 통해 사용자 정보 조회하고 user 객체에 담음
		User user = userService.userSelect(cookieUserId);
		
		if(user != null)
		{
			if(dogSeq > 0)
			{
				dog = adoptService.dogSelect(dogSeq);
			}
			
			//view 페이지로 넘길때 이용할 수 있게 각 키별로 값을 담아줌
			model.addAttribute("user", user);
			model.addAttribute("dog", dog);
				
			return "/adopt/dogAdopt";
		}
		else
		{
			return "/user/loginJoin";
		}
	}
	
	//입양신청 글쓰기
	@RequestMapping(value="/adopt/adoptProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> adoptProc(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long dogSeq = HttpUtil.get(request, "dogSeq", (int)0);
		String adtPeriod = HttpUtil.get(request, "q1", "");
		String adtReason = HttpUtil.get(request, "q2", "");
		String adtHome = HttpUtil.get(request, "q3", "");
		String adpAgree = HttpUtil.get(request, "q4", "");
		String adtPet = HttpUtil.get(request, "q5", "");
		
		//제목과 내용이 있을때만 HiBoard 객체를 생성하여 유저아이디(쿠키값), 제목, 내용을 세팅해주고, 파일첨부, ajax 통신 등을 함
		if(!StringUtil.isEmpty(adtPeriod) && !StringUtil.isEmpty(adtReason) && !StringUtil.isEmpty(adtHome)
				&& !StringUtil.isEmpty(adpAgree) && !StringUtil.isEmpty(adtPet))
		{
			Adopt adopt = new Adopt();
			
			adopt.setUserId(cookieUserId);
			adopt.setDogSeq(dogSeq);
			adopt.setAdtPeriod(adtPeriod);
			adopt.setAdtReason(adtReason);
			adopt.setAdtHome(adtHome);
			adopt.setAdpAgree(adpAgree);
			adopt.setAdtPet(adtPet);
			
			//실제 인서트가 성공했을 경우
			if(adoptService.adoptInsert(adopt) > 0)
			{
				ajaxResponse.setResponse(0, "Success");
			}
			else
			{
				ajaxResponse.setResponse(500, "Internal Server Error");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	
	//강아지 등록 페이지
	@RequestMapping(value="/adopt/dogWriteForm")
	public String dogWriteForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{		
		//쿠키값
		String searchType = HttpUtil.get(request, "searchType", "");
		String searchValue = HttpUtil.get(request, "searchValue", "");
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		Dog dog = new Dog();
		
		long nextDogSeq = adoptService.dogSeqSelect(dog);
		
		//view 페이지로 넘길때 이용할 수 있게 각 키별로 값을 담아줌
		model.addAttribute("searchType", searchType);	//"searchType" : writeForm value / searchType : controller value
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("nextDogSeq", nextDogSeq);
			
		return "/adopt/dogWriteForm";
	}
	
	//강아지 등록
	@RequestMapping(value="/adopt/dogWriteProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> dogWriteProc(MultipartHttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String dogName = HttpUtil.get(request, "_dogName", "");
		String dogGender = HttpUtil.get(request, "_gender", "");
		String dogMBTI = HttpUtil.get(request, "_species", "");
		String entDate = HttpUtil.get(request, "_endDate", "");
		String neutering = HttpUtil.get(request, "_neutering", "");
		String dogSig = HttpUtil.get(request, "_dogSig", "");
		FileData mainImg = HttpUtil.getFile2(request, "_mainImg", UPLOAD_DOG_SAVE_DIR);
		FileData subImg1 = HttpUtil.getFile2(request, "_subImg1", UPLOAD_DOG_SAVE_DIR);
		FileData subImg2 = HttpUtil.getFile2(request, "_subImg2", UPLOAD_DOG_SAVE_DIR);
		FileData subImg3 = HttpUtil.getFile2(request, "_subImg3", UPLOAD_DOG_SAVE_DIR);		
		
		logger.debug("dogName : " + dogName);
		logger.debug("dogGender : " + dogGender);
		logger.debug("dogMBTI : " + dogMBTI);
		logger.debug("entDate : " + entDate);
		logger.debug("neutering : " + neutering);
		logger.debug("dogSig : " + dogSig);
		
		
		//제목과 내용이 있을때만 HiBoard 객체를 생성하여 유저아이디(쿠키값), 제목, 내용을 세팅해주고, 파일첨부, ajax 통신 등을 함
		if(!StringUtil.isEmpty(dogName) && !StringUtil.isEmpty(dogGender) && !StringUtil.isEmpty(dogMBTI)
				&& !StringUtil.isEmpty(entDate) && !StringUtil.isEmpty(neutering) && !StringUtil.isEmpty(dogSig))
		{
			Dog dog = new Dog();
			
			int nextDogSeq = (int)adoptService.dogSeqSelect(dog);
			
			dog.setDogSeq(nextDogSeq);
			dog.setDogName(dogName);
			dog.setDogGender(dogGender);
			dog.setDogMBTI(dogMBTI);
			dog.setEntDate(entDate);
			dog.setNeutering(neutering);
			dog.setDogSig(dogSig);
			
			if(mainImg != null && mainImg.getFileSize() > 0)
			{
				dog.setDogMainImg("Y");
			}
			
			if(subImg1 != null && subImg1.getFileSize() > 0)
			{
				dog.setDogSubImg1("Y");
			}
			
			if(subImg2 != null && subImg2.getFileSize() > 0)
			{
				dog.setDogSubImg2("Y");
			}
			
			if(subImg3 != null && subImg3.getFileSize() > 0)
			{
				dog.setDogSubImg3("Y");
			}
			
			try
			{
				//실제 인서트가 성공했을 경우
				if(adoptService.dogInsert(dog) > 0)
				{
					ajaxResponse.setResponse(0, "Success");
				}
				else
				{
					ajaxResponse.setResponse(500, "Internal Server Error");
				}
			}
			catch(Exception e)
			{
				logger.error("[AdoptController] /adopt/dogWriteProc Exception", e);
				ajaxResponse.setResponse(500, "Internal Server Error");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/adopt/dogMatch", method=RequestMethod.GET)
	public String dogMatch(HttpServletRequest request, HttpServletResponse response)
	{
		return "/adopt/dogMatch";
	}
	
}
