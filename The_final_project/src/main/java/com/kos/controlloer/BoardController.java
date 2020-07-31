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
import javax.servlet.http.HttpSession;

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
import com.kos.socket.ListenerThread;
import com.kos.vo.Board;
import com.kos.vo.BoardVO;
import com.kos.vo.MemberVO;
import com.kos.vo.ReplNameVO;
import com.kos.vo.UploadImageVO;

@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;

	// 게시판 들어오면
	@RequestMapping("/callboard.do")
	public ModelAndView getBoardList(ModelAndView mv, BoardVO vo) {
		// 게시판 글을 읽어오기 위한 코딩
		System.out.println("emfdjdha$$$$$$$$$$$$$$$$$$$$$$$$");
		List<BoardVO> result = service.getBoardList(vo);

		// 다음에 갈 페이지 지정
		if (vo.getB_boardname().equals("nongsain")) {
			mv.setViewName("nongsain");

			// 다음 페이지로 넘길 값을 설정
			mv.addObject("boardlist", result); // 받아온 게시판 게시물
			mv.addObject("b_boardname", vo.getB_boardname()); // 게시판이름

			return mv;
		}
		mv.setViewName("general");
		mv.addObject("b_boardname", vo.getB_boardname()); // 게시판이름추가

		// 다음 페이지로 넘길 리스트가 제대로 받아와 졌는지 확인
		if (result.size() > 0) {
			mv.addObject("boardlist", result); // 받아온 게시판 게시물
			mv.addObject("confirm", 1); // 값이 제대로 넘어간것을 표현

			return mv;

		} else {
			// 제대로 들어오지 않았다면
			mv.addObject("confirm", 0);
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
	public ModelAndView writeBoard(ModelAndView mv, BoardVO vo, HttpServletResponse response, HttpSession session)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(vo.getTitle() + "제목");
		System.out.println(vo.getContents() + "내용##############");
		// 임시로 아이디 지정 ->나중에 지우기

		// vo.setId("kim");

		MemberVO info = (MemberVO) session.getAttribute("memberinfo");
		if (!info.getId().isEmpty()) {
			vo.setId(info.getId());
		} else {
			PrintWriter out = response.getWriter();

			out.println("<script>alert('세션이 만료되거나 로그인 상태가 아닙니다.'); location.href='index.do';</script>");
			mv.setViewName("redirect:/login.do");
			return mv;
		}

		System.out.println(vo.getB_boardname());

		// 사용자가 작성한 글 및 정보 전달

		service.writeBoard(vo);
		System.out.println("입력하고 돌아옴");

		// 넘기기
		mv.setViewName("redirect:/callboard.do?b_boardname=" + vo.getB_boardname());
		return mv;
	}

	// 글읽을 떄
	@RequestMapping("/viewboard.do")
	public ModelAndView viewBoard(ModelAndView mv, BoardVO vo) {
		if(vo.getB_boardname()==null) {
			vo.setB_boardname("free_board");
		}
		System.out.println("들어옴");
		System.out.println(vo.getB_boardname());
		System.out.println(vo.getBoardno());

		BoardVO result = service.viewBoard(vo);
		// 닉네임 추가
		result.setNickname(vo.getNickname());

		// System.out.println(result.getTitle()+"######################");
		System.out.println(result.getBoardView() + "뷰카운트");
		// 다음 페이지 지정
		if (vo.getB_boardname().equals("nongsain")) {
			mv.setViewName("viewboardNongsain");
			mv.addObject("board", result);

			return mv;
		}
		mv.setViewName("viewboard");
		mv.addObject("boardname", vo.getB_boardname());
		mv.addObject("board", result);

		return mv;

	}

	// 글 수정 버튼을 눌렀을 때
	@RequestMapping("/modifyboard.do")
	public ModelAndView modifyBoard(ModelAndView mv, BoardVO vo, HttpSession session, HttpServletResponse response)
			throws Exception {
		// 만약 세션이 없다면,
		if (session.getAttribute("memberinfo") == null) {
			PrintWriter out = response.getWriter();

			out.println("<script>alert('세션이 만료되거나 로그인 상태가 아닙니다.'); location.href='index.do';</script>");
			mv.setViewName("redirect:/login.do");
			return mv;
		}
		// 글 가져오기
		BoardVO result = service.viewBoard(vo);

		// 다음에 갈 페이지 지정 및 parameter 세팅
		System.out.println(vo.getB_boardname() + "이게 안나오는걸까?");
		mv.setViewName("modifyboard");
		mv.addObject("boardname", vo.getB_boardname());
		mv.addObject("board", result);

		return mv;
	}

	
	//글수정 완료 버튼이 눌렸을때
	@RequestMapping("/updateboard.do")
	public ModelAndView updateBoard(ModelAndView mv, BoardVO vo,HttpServletResponse response) throws IOException {
		System.out.println("updateboard 들어옴");
		System.out.println(vo.getB_boardname());
		System.out.println(vo.getBoardno());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContents());
		
		//수정된 내용으로 게시판 업데이트 쿼리 날리기
		int result = service.updateBoard(vo);
		
		//쿼리 날리고 받아온 결과가 0이상(정상적으로 수정되었다면)
		if (result > 0) {
			PrintWriter out = response.getWriter();

			out.println("<script>alert('수정이 완료 되었습니다.'); </script>");
		}
		mv.setViewName("redirect:/callboard.do?b_boardname="+vo.getB_boardname());
		return mv;
	}
	
	
	@RequestMapping("/index.do")
	public ModelAndView getAllBoardList(ModelAndView mv,HttpServletRequest request) {
		ListenerThread lt= ListenerThread.getInstance(request.getRealPath("/new"));
		//전체 게시판의 글들을 검색해서 index로 넘겨준다.
		BoardVO vo = new BoardVO();
		vo.setNowpage(1);
		vo.setViewing_count(10);
		
		
		//모든 게시판의 db명을 가져와서 반복문으로 돌려 최근 10개의 게시물을 가져온다.
		for(String row:vo.allBoardList()) {
			
			//게시판이름을 세팅한다.
			vo.setB_boardname(row);
			
			//세팅된 게시판에 있는 것들을 가져온다.
			Object rawboard =service.getBoardList(vo);
			
			//받아온 데이터가 있으면
			if(rawboard!=null) {
				mv.addObject(row,rawboard);
				mv.addObject(row+"con", 1);
			//만약 없다면	
			}else {
				mv.addObject(row+"con", 0);
			}
			
			
		}
		
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
	
	
	//댓글 작성
	@RequestMapping("/writerepl.do")
	@ResponseBody
	public String writeRepl(ModelAndView mv, BoardVO vo,HttpSession session) {


		ReplNameVO re = new ReplNameVO(vo);
		vo.setB_boardname(re.changeName());
		vo.setId(((MemberVO) session.getAttribute("memberinfo")).getId());

		// 댓글 저장
		service.writeRepl(vo);

		return "success";

	}
	
	
	
	
	//댓글 목록
	@RequestMapping("/viewrepl.do")
	@ResponseBody
	public List<BoardVO> viewRepl(ModelAndView mv, BoardVO vo) {

		ReplNameVO re = new ReplNameVO(vo);
		vo.setB_boardname(re.changeName());
		List<BoardVO> result = (List<BoardVO>)service.viewBoardRepl(vo);

		return result;


	}

	@RequestMapping("/getrepl.do")
	@ResponseBody
	public BoardVO getRepl(ModelAndView mv, BoardVO vo) {
		System.out.println(vo.getB_boardname()+"++++++++++++++++getRepl");
		System.out.println(vo.getReplno());
		ReplNameVO re = new ReplNameVO(vo);
		vo.setB_boardname(re.changeName());
		System.out.println(vo.getB_boardname());
		BoardVO result = (BoardVO)service.getRepl(vo);
		System.out.println(result);
		return result;

	}
	//댓글 삭제
	@RequestMapping("/delrepl.do")
	@ResponseBody
	public void delRepl(ModelAndView mv, BoardVO vo) {

		service.delRepl(vo);		

	}

	


	
	//댓글 수정
	@RequestMapping("/modifyrepl.do")
	@ResponseBody
	public void modifyRepl(ModelAndView mv, BoardVO vo) {

		service.modifyRepl(vo);		

	}



	// 이미지 업로드에서 사용하는 컨트롤러
	@RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile,
			UploadImageVO vo) throws Exception {
		
		
		
		
		
		
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		System.out.println(file + "%%%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println(vo.getBoardname());
		// 파일이 있는지 확인
		if (file != null) {
			// 파일이름이 없는지 확인
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {

				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						// 파일이름 가져오기
						String fileName = file.getName();
						// 파일가져오기
						byte[] bytes = file.getBytes();
						// 저장경로 지정
						String uploadPath = req.getSession().getServletContext().getRealPath("")
								+ "\\resources\\uploadimage";
						// String uploadPath =
						// "C:\\Users\\Canon\\Documents\\GitHub\\final\\The_final_project\\src\\main\\webapp\\resources\\uploadimage";

						System.out.println(uploadPath);
						// 디렉토리 만듦
						File uploadFile = new File(uploadPath);

						// 업로드하는 파일의 경로가 없으면 만든다
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}

						// 파일이름 랜덤생성
						fileName = UUID.randomUUID().toString();

						// 파일 저장경로지정및 저장
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						resp.setContentType("text/html");
						String fileUrl = req.getContextPath() + "\\resources\\uploadimage\\" + fileName;
						System.out.println(fileUrl);
						// 이미지 파일의 상태를 저장하기위한 service 호출 부분

						// 각 게시판에 따라서 분기를 나눔
						
						if (vo.getBoardname().equals("free_board")) {
							vo.setBoardno(BoardVO.FREE_BOARD);
						}

						vo.setImgName(fileName);
						service.storeImage(vo);
						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야함.
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);

						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//글삭제시
	@RequestMapping("/deleteboard.do")
	public ModelAndView deleteboard(ModelAndView mv ,BoardVO vo) {
		
		service.deleteBoard(vo);
		System.out.println("댓글삭제 나옴+^^^^^^^^^^^^^^^^");
		//mv.setViewName("redirect:/callboard.do?b_boardname="+vo.getB_boardname());
		mv.setViewName("redirect:/callboard.do?b_boardname="+vo.getB_boardname());
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
