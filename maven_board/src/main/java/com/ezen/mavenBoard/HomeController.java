package com.ezen.mavenBoard;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.mavenBoard.model.BoardDTO;
import com.ezen.mavenBoard.service.BoardMapper;




/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "list";
	}*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(){
		return "main";
	}
	@RequestMapping("/board_list.do")
	public String list(HttpServletRequest req){
		List<BoardDTO> list = boardMapper.listBoard();
		req.setAttribute("boardList", list);
		
		return "list";
	}
	@RequestMapping(value="/board_write.do", method=RequestMethod.GET)
	public String  writeForm(){
		return "writeForm";
	}
	
	@RequestMapping(value="/board_write.do", method=RequestMethod.POST)
	public String writePro(HttpServletRequest req,@ModelAttribute BoardDTO dto,BindingResult result){
		if (result.hasErrors()){
			dto.setNum(0);
		}                                                
		dto.setIp(req.getRemoteAddr());
		
		String filename="";
		int filesize=0;
		MultipartHttpServletRequest mr =(MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target = new File(upLoadPath,file.getOriginalFilename());
		if(file.getSize()>0){
			try{
				file.transferTo(target);
			}catch(IOException e){}
			filename = file.getOriginalFilename();
			filesize =(int)file.getSize();
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		int res =boardMapper.insertBoard(dto);
		String msg = null, url = null;
		if (res>0){
			msg = "게시글 등록 성공!! 게시글 목록페이지로 이동합니다.";
			url = "board_list.do";
		}else {
			msg = "게시글 등록 실패!! 게시글 등록페이지로 이동합니다.";
			url = "board_write.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/content.do")
	public String content(HttpServletRequest req, @RequestParam int num){
		boardMapper.plusReadcount(num);
		BoardDTO dto = boardMapper.getBoard(num);
		req.setAttribute("getBoard", dto);
		return "content";
	}
	
	@RequestMapping(value="/board_delete.do", method=RequestMethod.GET)
	public String deleteForm(){
		return "deleteForm";
	}
	
	@RequestMapping(value="/board_delete.do", method=RequestMethod.POST)
	public ModelAndView deletePro(@RequestParam int num, @RequestParam String passwd){
		int res = boardMapper.deleteBoard(num, passwd);
		return new ModelAndView("redirect:board_list.do");
	}
	
	@RequestMapping(value="/board_update.do", method=RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam int num){
		BoardDTO dto = boardMapper.getBoard(num);
		return new ModelAndView("updateForm", "getBoard", dto);
	}
	
	@RequestMapping(value="/board_update.do", method=RequestMethod.POST)
	public String updatePro(BoardDTO dto){
		int res = boardMapper.updateBoard(dto);
		return "redirect:board_list.do";
	}
	
	
}
