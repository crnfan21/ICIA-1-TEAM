package com.icia.web.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.servlet.ModelAndView;

import com.icia.common.model.FileData;
import com.icia.common.util.FileUtil;
import com.icia.common.util.StringUtil;
import com.icia.web.model.HiBoard;
import com.icia.web.model.HiBoardFile;
import com.icia.web.model.Paging;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.HiBoardService;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;

@Controller("hiBoardController")
public class HiBoardController 
{
	private static Logger logger = LoggerFactory.getLogger(HiBoardController.class);
	
	//쿠키명
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	//파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Autowired
	private HiBoardService hiBoardService;
	
	@Autowired
	private UserService userService;
	
	private static final int LIST_COUNT = 5;		//한페이지의 게시물 수
	private static final int PAGE_COUNT = 5; 		//페이징 수

	@RequestMapping(value="/about/notice")
	public String list(ModelMap model, HttpServletRequest request, HttpServletResponse reponse)
	{
		//조회항목(1:작성자, 2:제목, 3:내용)
		String searchType = HttpUtil.get(request, "searchType");
		//조회값
		String searchValue = HttpUtil.get(request, "searchValue");
		//현재 페이지
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		long totalCount = 0;
		List<HiBoard> list = null;
		//페이징 객체
		Paging paging = null;
		//조회객체
		HiBoard search = new HiBoard();
		
		if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
		{
			search.setSearchType(searchType);
			search.setSearchValue(searchValue);
		}
		else
		{
			searchType = "";
			searchValue = "";
		}
		
		totalCount = hiBoardService.boardListCount(search);
		
		logger.debug("totalCount : " + totalCount);
		
		if(totalCount > 0)
		{
			//페이징 처리 추가
			//실제 리스트 값을 가져오기
			paging = new Paging("/about/notice", totalCount, LIST_COUNT,PAGE_COUNT, curPage, "curPage");
			
			paging.addParam("searchType", searchType);
			paging.addParam("searchValue", searchValue);
			paging.addParam("curPage", curPage);
			
			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());
			
			list = hiBoardService.boardList(search);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		
		
		return "/about/notice";
	}
	
	//게시판 글쓰기
	@RequestMapping(value="/about/writeForm")
	public String writeForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		//쿠키값
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String searchType = HttpUtil.get(request, "searchType", "");
		String searchValue = HttpUtil.get(request, "searchValue", "");
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		//사용자 정보 조회
		User user = userService.userSelect(cookieUserId);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("user", user);
		
		return "/about/writeForm";
	}
	
	//게시물 등록
	@RequestMapping(value="/about/writeProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> writeProc(MultipartHttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String hiBbsTitle = HttpUtil.get(request, "hiBbsTitle", "");
		String hiBbsContent = HttpUtil.get(request, "hiBbsContent", "");
		FileData fileData = HttpUtil.getFile(request, "hiBbsFile", UPLOAD_SAVE_DIR);
		
		if(!StringUtil.isEmpty(hiBbsTitle) && !StringUtil.isEmpty(hiBbsContent))
		{
			HiBoard hiBoard = new HiBoard();
			
			hiBoard.setUserId(cookieUserId);
			hiBoard.setHiBbsTitle(hiBbsTitle);
			hiBoard.setHiBbsContent(hiBbsContent);
			
			if(fileData != null && fileData.getFileSize() >0)
			{
				HiBoardFile hiBoardFile = new HiBoardFile();
				
				hiBoardFile.setFileName(fileData.getFileName());
				hiBoardFile.setFileOrgName(fileData.getFileOrgName());
				hiBoardFile.setFileExt(fileData.getFileExt());
				hiBoardFile.setFileSize(fileData.getFileSize());
				
				hiBoard.setHiBoardFile(hiBoardFile);
			}
			
			//게시물, 게시물 파일첨부 적용
			try
			{
				if(hiBoardService.boardInsert(hiBoard) > 0)
				{
					ajaxResponse.setResponse(0, "Success");
				}
				else
				{
					ajaxResponse.setResponse(500, "Insert Sever Error");
				}
			}
			catch(Exception e)
			{
				logger.error("[HiBoardController] /board/writeProc Exception", e);
				ajaxResponse.setResponse(500, "Insert Sever Error");
			}
			
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	//게시물 조회
	@RequestMapping(value="/board/view")
	public String view(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	   {
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	      long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
	      String searchType = HttpUtil.get(request, "searchType", "");
	      String searchValue = HttpUtil.get(request, "searchValue", "");
	      long curPage = HttpUtil.get(request, "curPage", (long)1);
	      
	      //본인글 여부
	      String boardMe = "N";
	      HiBoard hiBoard = null;
	      
	      if(hiBbsSeq > 0)
	      {
	         hiBoard = hiBoardService.boardView(hiBbsSeq);
	         
	         if(hiBoard != null && StringUtil.equals(hiBoard.getUserId(), cookieUserId))
	        {
	            boardMe ="Y";            
	        }
	      }
	      
	      model.addAttribute("hiBbsSeq", hiBbsSeq);
	      model.addAttribute("hiBoard", hiBoard);
	      model.addAttribute("boardMe", boardMe);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("searchValue", searchValue);
	      model.addAttribute("curPage", curPage);
	      
	      return "/board/view";
	   }
	//게시물 삭제
	@RequestMapping(value="/board/delete", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> delete(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		
		if(hiBbsSeq > 0)
		{
			HiBoard hiBoard= hiBoardService.boardSelect(hiBbsSeq);
			
			if(hiBoard != null)
			{
				if(StringUtil.equals(hiBoard.getUserId(), cookieUserId))
				{
					try
					{
						if(hiBoardService.boardAnswersCount(hiBoard.getHiBbsSeq()) > 0)
						{
							ajaxResponse.setResponse(-999, "Answers exist and cannot be deleted");
						}
						else
						{
							if(hiBoardService.boardDelete(hiBoard.getHiBbsSeq()) > 0)
							{
								ajaxResponse.setResponse(0, "Success");
							}
							else
							{
								ajaxResponse.setResponse(500, "Internal Server Error");
							}
						}
					}
					catch(Exception e)
					{
						logger.error("[HiBoardController] delete Exception", e);
						ajaxResponse.setResponse(500, "Internal Server Error");
					}
				}
				else
				{
					ajaxResponse.setResponse(405, "User Error");

				}
			}
			else
			{
				ajaxResponse.setResponse(404, "Not Found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	
	//첨부파일 다운로드
	@RequestMapping("/board/download")
	public ModelAndView download(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView modelAndView = null;
		
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		
		if(hiBbsSeq > 0)
		{
			HiBoardFile hiBoardFile = hiBoardService.boardFileSelect(hiBbsSeq);
			
			if(hiBoardFile != null)
			{
				File file = new File(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() + hiBoardFile.getFileName());
				
				logger.debug("UPLOAD_SAVE_DIR : " + UPLOAD_SAVE_DIR);
				logger.debug("FileUtil.getFileSeaparator() : " + FileUtil.getFileSeparator());
				logger.debug("hiBoardFile.getFileName() : " + hiBoardFile.getFileName());
				
				if(FileUtil.isFile(file))
				{
					modelAndView = new ModelAndView();
					
					modelAndView.setViewName("fileDownloadView");
					
					modelAndView.addObject("file", file);
					modelAndView.addObject("fileName", hiBoardFile.getFileOrgName());
					
					return modelAndView;
					
					
				}
			}
		}
		
		return modelAndView;
	}
	
	//게시물 수정 폼
	@RequestMapping(value="/board/updateForm")
	public String updateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId =CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		String searchType = HttpUtil.get(request, "searchType", "");
		String searchValue = HttpUtil.get(request, "searchValue", "");
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		HiBoard hiBoard = null;
		
		if(hiBbsSeq > 0)
		{
			hiBoard = hiBoardService.boardViewList(hiBbsSeq);
			
			if(hiBoard != null)
			{
				if(!StringUtil.equals(hiBoard.getUserId(), cookieUserId))
				{
					hiBoard = null;
				}
			}
		}
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("hiBoard", hiBoard);
		
		
		return "/board/updateForm";
	}
	
	@RequestMapping(value= "/board/updateProc", method= RequestMethod.POST)
	@ResponseBody
	public Response<Object>updateProc(MultipartHttpServletRequest request,  HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		String hiBbsTitle = HttpUtil.get(request, "hiBbsTitle", "");
		String hiBbsContent = HttpUtil.get(request, "hiBbsContent", "");
		FileData fileData = HttpUtil.getFile(request, "hiBbsFile", UPLOAD_SAVE_DIR);
		
		if(hiBbsSeq > 0 && !StringUtil.isEmpty(hiBbsTitle) && !StringUtil.isEmpty(hiBbsContent))
		{
			HiBoard hiBoard = hiBoardService.boardSelect(hiBbsSeq);
			
			if(hiBoard != null)
			{
				if(StringUtil.equals(hiBoard.getUserId(), cookieUserId))
				{
					hiBoard.setHiBbsSeq(hiBbsSeq);
					hiBoard.setHiBbsTitle(hiBbsTitle);
					hiBoard.setHiBbsContent(hiBbsContent);
					
					if(fileData != null && fileData.getFileSize() > 0)
					{
						HiBoardFile hiBoardFile = new HiBoardFile();
						
						hiBoardFile.setFileName(fileData.getFileName());
						hiBoardFile.setFileOrgName(fileData.getFileOrgName());
						hiBoardFile.setFileExt(fileData.getFileExt());
						hiBoardFile.setFileSize(fileData.getFileSize());
						
						hiBoard.setHiBoardFile(hiBoardFile);
					}
					
					//service 적용
					try
					{
						if(hiBoardService.boardUpdate(hiBoard) > 0)
						{
							ajaxResponse.setResponse(0, "Success");
						}
						else
						{
							ajaxResponse.setResponse(404, "Not Found");
						}
					}
					catch(Exception e)
					{
						logger.error("[HiBoardController] updateProc Exception", e);
						ajaxResponse.setResponse(500, "Internal Server Error");
					}
				}
				else
				{	//본인게시물이 아닌 경우
					ajaxResponse.setResponse(404, "Not Found");
				}
			}
			else
			{
				ajaxResponse.setResponse(401, "Not Found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	//첨부파일 삭제=======================================================================================================================
	@RequestMapping(value="/board/deleteFileProc")
	@ResponseBody
	public Response<Object> deleteFileProc(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		
		if(hiBbsSeq > 0)
		{
			HiBoard hiBoard = hiBoardService.boardSelect(hiBbsSeq);
			
			if(hiBoard != null)
			{
				if(StringUtil.equals(hiBoard.getUserId(), cookieUserId))
				{
					HiBoardFile hiBoardFile = hiBoardService.boardFileSelect(hiBbsSeq);
					
					hiBoard.setHiBoardFile(hiBoardFile);
					
					if(hiBoardFile != null)
					{
						//파일삭제 추가
						try
						{
							if(hiBoardService.boardFileDelete(hiBoard) > 0)
							{
								ajaxResponse.setResponse(0, "Success");
							}
							else
							{
								ajaxResponse.setResponse(500, "Bad Request");
							}
						}
						catch(Exception e)
						{
							logger.error("[HiBoardController] deleteFileProc Exception", e);
							ajaxResponse.setResponse(500, "Internal Server Error");
						}
					}
					else
					{
						ajaxResponse.setResponse(404, "Bad Request");
					}
				}
				else
				{
					ajaxResponse.setResponse(401, "Bad Request");
				}
			}
			else
			{
				ajaxResponse.setResponse(404, "Bad Request");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}

	//================================================================================================================================
	//게시물 답변 폼
	@RequestMapping(value="/board/replyForm", method=RequestMethod.POST)
	public String replyForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		String searchType = HttpUtil.get(request, "searchType", "");
		String searchValue = HttpUtil.get(request, "searchValue", "");
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		HiBoard hiBoard = null;
		User user = null;
		
		if(hiBbsSeq > 0)
		{
			hiBoard = hiBoardService.boardSelect(hiBbsSeq);
			
			if(hiBoard != null)
			{
				user = userService.userSelect(cookieUserId);
			}
		}
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("hiBoard", hiBoard);
		model.addAttribute("user", user);
			
		return "/board/replyForm";
	}
	
	//게시물 답변 
	@RequestMapping(value="/board/replyProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> replyProc(MultipartHttpServletRequest request,HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		String hiBbsTitle = HttpUtil.get(request, "hiBbsTitle", "");
		String hiBbsContent = HttpUtil.get(request, "hiBbsContent", "");
		FileData fileData = HttpUtil.getFile(request, "hiBbsFile", UPLOAD_SAVE_DIR);
		
		if(hiBbsSeq > 0 && !StringUtil.isEmpty(hiBbsTitle) && !StringUtil.isEmpty(hiBbsContent))
		{
			HiBoard parentHiBoard = hiBoardService.boardSelect(hiBbsSeq);
			
			if(parentHiBoard != null)
			{
				HiBoard hiBoard = new HiBoard();
				
				hiBoard.setUserId(cookieUserId);
				hiBoard.setHiBbsTitle(hiBbsTitle);
				hiBoard.setHiBbsContent(hiBbsContent);
				hiBoard.setHiBbsGroup(parentHiBoard.getHiBbsGroup());
				hiBoard.setHiBbsOrder(parentHiBoard.getHiBbsOrder() + 1);
				hiBoard.setHiBbsIndent(parentHiBoard.getHiBbsIndent() + 1);
				hiBoard.setHiBbsParent(hiBbsSeq);
				
				if(fileData != null && fileData.getFileSize() > 0)
				{
					HiBoardFile hiBoardFile = new HiBoardFile();
					
					hiBoardFile.setFileName(fileData.getFileName());
					hiBoardFile.setFileOrgName(fileData.getFileOrgName());
					hiBoardFile.setFileExt(fileData.getFileExt());
					hiBoardFile.setFileSize(fileData.getFileSize());
					
					hiBoard.setHiBoardFile(hiBoardFile);
				}
				try
				{
					if(hiBoardService.boardReplyInsert(hiBoard) > 0)
					{
						ajaxResponse.setResponse(0, "Success");
					}
					else
					{
						ajaxResponse.setResponse(500, "Internal Sever Error");
					}
				}
				catch(Exception e)
				{
					logger.error("[HiBoardController] replyProc Exception", e);
					ajaxResponse.setResponse(500, "Internal Sever Error");
				}
			}
			else
			{
				ajaxResponse.setResponse(404, "Not Found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	//게시물 답변 2===========================================================================================================
	@RequestMapping(value="/board/replyProc2", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> replyProc2(MultipartHttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long hiBbsSeq = HttpUtil.get(request, "hiBbsSeq", (long)0);
		String hiBbsTitle = HttpUtil.get(request, "hiBbsTitle", "");
		String hiBbsContent = HttpUtil.get(request, "hiBbsContent", "");
		FileData fileData = HttpUtil.getFile(request, "hiBbsFile", UPLOAD_SAVE_DIR);
		
		if(hiBbsSeq > 0 && !StringUtil.isEmpty(hiBbsTitle) && !StringUtil.isEmpty(hiBbsContent))
		{
			HiBoard parentHiBoard = hiBoardService.boardSelect(hiBbsSeq);
			
			if(parentHiBoard != null)
			{
				HiBoard hiBoard = new HiBoard();
				
				hiBoard.setUserId(cookieUserId);
				hiBoard.setHiBbsTitle(hiBbsTitle);
				hiBoard.setHiBbsContent(hiBbsContent);
				hiBoard.setHiBbsGroup(parentHiBoard.getHiBbsGroup());
				hiBoard.setHiBbsIndent(parentHiBoard.getHiBbsIndent() + 1);
				hiBoard.setHiBbsParent(hiBbsSeq);
				
				if(fileData != null && fileData.getFileSize() > 0)
				{
					HiBoardFile hiBoardFile = new HiBoardFile();
					
					hiBoardFile.setFileName(fileData.getFileName());
					hiBoardFile.setFileOrgName(fileData.getFileOrgName());
					hiBoardFile.setFileExt(fileData.getFileExt());
					hiBoardFile.setFileSize(fileData.getFileSize());
					
					hiBoard.setHiBoardFile(hiBoardFile);
				}
				try
				{
					if(hiBoardService.boardReplyInsert(hiBoard) > 0)
					{
						ajaxResponse.setResponse(0, "Success");
					}
					else
					{
						ajaxResponse.setResponse(500, "Internal Sever Error");
					}
				}
				catch(Exception e)
				{
					logger.error("[HiBoardController] replyProc Exception", e);
					ajaxResponse.setResponse(500, "Internal Sever Error");
				}
			}
			else
			{
				ajaxResponse.setResponse(404, "Not Found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	//====================================================================================================================
}
