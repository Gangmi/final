package com.kos.controlloer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.kos.service.BoardServiceImpl;
import com.kos.vo.BoardVO;


@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;

	// 게시판 들어오면
	@RequestMapping("/callboard.do")
	public ModelAndView getBoardList(ModelAndView mv, BoardVO vo) {
		// 게시판 글을 읽어오기 위한 코딩

		List<BoardVO> result = service.getBoardList(vo);
	
		// 다음에 갈 페이지 지정
		if(vo.getB_boardname().equals("nongsain")) {
			mv.setViewName("nongsain");

			// 다음 페이지로 넘길 값을 설정
			mv.addObject("boardlist", result); // 받아온 게시판 게시물
			mv.addObject("b_boardname", vo.getB_boardname()); // 게시판이름
			
			return mv;
		}
		mv.setViewName("general");
		mv.addObject("b_boardname", vo.getB_boardname()); // 게시판이름추가
		
		
		// 다음 페이지로 넘길 리스트가 제대로 받아와 졌는지 확인
		if(result.size()>0) {
		mv.addObject("boardlist", result); // 받아온 게시판 게시물
		mv.addObject("confirm",1); // 값이 제대로 넘어간것을 표현
		
		return mv;
		
		}else {
			// 제대로 들어오지 않았다면
			mv.addObject("confirm",0);
			return mv;
		}

	}

	// 글쓰기 페이지 요청이 들어왔을 때
	@RequestMapping("/writeboard.do")
	public ModelAndView callWritePage(ModelAndView mv, BoardVO vo) {
		// 다음페이지 지정
		mv.setViewName("writeboard");
		// 현재 게시판의 이름 전달
		mv.addObject("b_boardname", vo.getB_boardname());
		return mv;
	}

	// 글쓸 때
	@RequestMapping("/write.do")
	public ModelAndView writeBoard(ModelAndView mv, BoardVO vo,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(vo.getTitle() + "제목");
		System.out.println(vo.getContents() + "내용##############");
		// 임시로 아이디 지정 ->나중에 지우기
		vo.setId("kim");
		System.out.println(vo.getB_boardname());

		
		

		// 사용자가 작성한 글 및 정보 전달
		
			service.writeBoard(vo);


		// 넘기기
		mv.setViewName("redirect:/general.do?b_boardname="+vo.getB_boardname());
		return mv;
	}

	// 글읽을 떄
	@RequestMapping("/viewboard.do")
	public ModelAndView viewBoard(ModelAndView mv, BoardVO vo) {
		System.out.println("들어옴");
		System.out.println(vo.getB_boardname());
		System.out.println(vo.getBoardno());

		BoardVO result = service.viewBoard(vo);
		// System.out.println(result.getTitle()+"######################");
		System.out.println(result.getBoardView() + "뷰카운트");
		// 다음 페이지 지정
		if(vo.getB_boardname().equals("nongsain")) {
			mv.setViewName("viewboardNongsain");
			mv.addObject("board", result);

			return mv;
		}
		mv.setViewName("viewboard");
		mv.addObject("board", result);

		return mv;


	}

	 

//	@RequestMapping("imageUpload.do")
//	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
//			@RequestParam MultipartFile upload) throws Exception{
//
//		//http hearder 설정
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
//		//http body
//		//업로드한 파일 이름
//		String fileName = upload.getOriginalFilename();
//		
//
//		//바이트 배열로 변환
//		byte[] bytes = upload.getBytes();
//		//이미지를 업로드할 디렉토리(배포 경로로 설정)
//
//		String uploadPath = "C:\\Users\\uoygn\\Desktop\\WebDevelop\\Shop\\blog\\src\\main\\webapp\\resources\\uploadimage";
//
//		
//
//		//서버에 저장됨
//
//		OutputStream out = new FileOutputStream(new File(uploadPath + fileName)); //java.io
//
//		out.write(bytes);
//
//		String callback = request.getParameter("CKEditorFuncNum");
//
//		
//
//		PrintWriter printWriter = response.getWriter();
//
//		String fileUrl = request.getContextPath() + "/uploadimage/" + fileName;
//
//		System.out.println("fileUrl: " + fileUrl);
//
//		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("
//
//		+callback+",'"+fileUrl+"','이미지가 업로드 되었습니다.')" + "</script>");
//
//		
//
//		//스트림닫기
//
//		printWriter.flush();
//
//
//	}




	// 이미지 업로드에서 사용하는 컨트롤러
	@RequestMapping(value = "/imageUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile,BoardVO vo) throws Exception {
		System.out.println("durl"+"###############################");
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null; 
		MultipartFile file = multiFile.getFile("upload");
		System.out.println(file);
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						System.out.println(req.getRealPath("/"));
						String uploadPath = req.getRealPath("/")+"resources/uploadimage";
						System.out.println(uploadPath);
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl =req.getContextPath()+"\\resources\\uploadimage\\"+fileName;
                        System.out.println(fileUrl);
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	
        
   
	
	
	
	
}
