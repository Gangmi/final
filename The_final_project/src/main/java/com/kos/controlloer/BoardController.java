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
import com.kos.vo.PagingVO;
import com.kos.vo.ReplNameVO;
import com.kos.vo.UploadImageVO;

@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;

	// �Խ��� ������
	@RequestMapping("/callboard.do")
	public ModelAndView getBoardList(ModelAndView mv, BoardVO vo) {
		// �Խ��� ���� �о���� ���� �ڵ�
		System.out.println(vo.getSearchword()+"emfdjdha$$$$$$$$$$$$$$$$$$$$$$$$");
		List<BoardVO> result = service.getBoardList(vo);
		
		//�˻��� �˻��� �ִٸ�
		
		if(!vo.getSearchword().equals("")) {
			System.out.println("�˻�� �ִ�.");
			mv.addObject("searchword", vo.getSearchword());
		}
		
		mv.setViewName("general");
		mv.addObject("b_boardname", vo.getB_boardname()); // �Խ����̸��߰�

		// ���� �������� �ѱ� ����Ʈ�� ����� �޾ƿ� ������ Ȯ��
		if (result.size() > 0) {
			mv.addObject("boardlist", result); // �޾ƿ� �Խ��� �Խù�
			mv.addObject("confirm", 1); // ���� ����� �Ѿ���� ǥ��

			return mv;

		} else {
			// ����� ������ �ʾҴٸ�
			mv.addObject("confirm", 0);
			return mv;
		}

	}

	// �۾��� ������ ��û�� ������ ��
	@RequestMapping("/writeboard.do")
	public ModelAndView callWritePage(ModelAndView mv, BoardVO vo) {
		// ���������� ����
		
		mv.setViewName("writeboard");

		// ���� �Խ����� �̸� ����
		mv.addObject("b_boardname", vo.getB_boardname());
		return mv;
	}

	// �۾� ��
	@RequestMapping("/write.do")
	public ModelAndView writeBoard(ModelAndView mv, BoardVO vo, HttpServletResponse response, HttpSession session)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(vo.getTitle() + "����");
		System.out.println(vo.getContents() + "����##############");
		// �ӽ÷� ���̵� ���� ->���߿� �����

		// vo.setId("kim");
		System.out.println(vo.getB_boardname());
		MemberVO info = (MemberVO) session.getAttribute("memberinfo");
		if (!info.getId().isEmpty()) {
			vo.setId(info.getId());
		} else {
			PrintWriter out = response.getWriter();

			out.println("<script>alert('������ ����ǰų� �α��� ���°� �ƴմϴ�.'); location.href='index.do';</script>");
			mv.setViewName("redirect:/login.do");
			return mv;
		}

		System.out.println(vo.getB_boardname());

		// ����ڰ� �ۼ��� �� �� ���� ����

		service.writeBoard(vo);
		System.out.println("�Է��ϰ� ���ƿ�");

		// �ѱ��
		mv.setViewName("redirect:/callboard.do?b_boardname=" + vo.getB_boardname());
		return mv;
	}
	

		@RequestMapping("/writeAnswer.do")
		@ResponseBody
		public ModelAndView writeAnswer(ModelAndView mv, BoardVO vo, HttpServletResponse response, HttpSession session)
				throws Exception {
			response.setContentType("text/html; charset=UTF-8");
			System.out.println(vo.getB_boardname()+ "�Խ����̸�||||");
			System.out.println(vo.getContents() + "����||||");
			System.out.println(vo.getBoardno()+"�۹�ȣ||||");
			System.out.println(vo.getId()+"���̵�||||");
			// �ӽ÷� ���̵� ���� ->���߿� �����

			// vo.setId("kim");
//			ReplNameVO re = new ReplNameVO(vo);
//			vo.setB_boardname(re.changeName());
			MemberVO info = (MemberVO) session.getAttribute("memberinfo");
			if (!info.getId().isEmpty()) {
				vo.setId(info.getId());
			} else {
				PrintWriter out = response.getWriter();

				out.println("<script>alert('������ ����ǰų� �α��� ���°� �ƴմϴ�.'); location.href='index.do';</script>");
				mv.setViewName("redirect:/login.do");
				return mv;
			}
			vo.setId(vo.getId());
			System.out.println(vo.getId()+"���̵�||||");
			System.out.println(vo.getB_boardname());

			// ����ڰ� �ۼ��� �� �� ���� ����

			service.writeBoard(vo);
			System.out.println("�Է��ϰ� ���ƿ�");

			// �ѱ��
			mv.setViewName("redirect:/viewboard.do?b_boardname=nongsain&boardno="+vo.getBoardno()+"&nickname="+vo.getNickname());
			
			return mv;
		}

	// ������ ��
	@RequestMapping("/viewboard.do")
	public ModelAndView viewBoard(ModelAndView mv, BoardVO vo) {
//		if(vo.getB_boardname()==null) {
//			vo.setB_boardname("free_board");
//		}
		System.out.println("����");
		System.out.println(vo.getB_boardname());
		System.out.println(vo.getBoardno());

		BoardVO result = service.viewBoard(vo);
		List<BoardVO> Answer = (List<BoardVO>)service.AnswerList(vo);
		// �г��� �߰�
		result.setNickname(vo.getNickname());

		// System.out.println(result.getTitle()+"######################");
		System.out.println(result.getBoardView() + "��ī��Ʈ");
		// ���� ������ ����
		if(vo.getB_boardname().equals("nongsain")) {
			mv.setViewName("nongsain");
		}else {
			mv.setViewName("viewboard");
		}
		mv.addObject("boardname", vo.getB_boardname());
		mv.addObject("board", result);
		mv.addObject("Answer",Answer);

		return mv;

	}

	// �� ���� ��ư�� ������ ��
	@RequestMapping("/modifyboard.do")
	public ModelAndView modifyBoard(ModelAndView mv, BoardVO vo, HttpSession session, HttpServletResponse response)
			throws Exception {
		// ���� ������ ���ٸ�,
		if (session.getAttribute("memberinfo") == null) {
			PrintWriter out = response.getWriter();

			out.println("<script>alert('������ ����ǰų� �α��� ���°� �ƴմϴ�.'); location.href='index.do';</script>");
			mv.setViewName("redirect:/login.do");
			return mv;
		}
		// �� ��������
		BoardVO result = service.viewBoard(vo);

		// ������ �� ������ ���� �� parameter ����
		System.out.println(vo.getB_boardname() + "�̰� �ȳ����°ɱ�?");
		mv.setViewName("modifyboard");
		mv.addObject("boardname", vo.getB_boardname());
		mv.addObject("board", result);

		return mv;
	}

	
	//�ۼ��� �Ϸ� ��ư�� ��������
	@RequestMapping("/updateboard.do")
	public ModelAndView updateBoard(ModelAndView mv, BoardVO vo,HttpServletResponse response) throws IOException {
		System.out.println("updateboard ����");
		System.out.println(vo.getB_boardname());
		System.out.println(vo.getBoardno());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContents());
		
		//������ �������� �Խ��� ������Ʈ ���� ������
		int result = service.updateBoard(vo);
		
		//���� ������ �޾ƿ� ����� 0�̻�(���������� �����Ǿ��ٸ�)
		if (result > 0) {
			PrintWriter out = response.getWriter();

			out.println("<script>alert('������ �Ϸ� �Ǿ����ϴ�.'); </script>");
		}
		mv.setViewName("redirect:/callboard.do?b_boardname="+vo.getB_boardname());
		return mv;
	}
	
	
	@RequestMapping("/index.do")
	public ModelAndView getAllBoardList(ModelAndView mv,HttpServletRequest request) {
		ListenerThread lt= ListenerThread.getInstance(request.getRealPath("/new"));
		//��ü �Խ����� �۵��� �˻��ؼ� index�� �Ѱ��ش�.
		BoardVO vo = new BoardVO();
		vo.setNowpage(1);
		vo.setViewing_count(8);
		
		
		//��� �Խ����� db���� �����ͼ� �ݺ������� ���� �ֱ� 10���� �Խù��� �����´�.
		for(String row:vo.allBoardList()) {
			
			//�Խ����̸��� �����Ѵ�.
			vo.setB_boardname(row);
			
			//���õ� �Խ��ǿ� �ִ� �͵��� �����´�.
			Object rawboard =service.getBoardList(vo);
			
			//�޾ƿ� �����Ͱ� ������
			if(rawboard!=null) {
				mv.addObject(row,rawboard);
				mv.addObject(row+"con", 1);
			//���� ���ٸ�	
			}else {
				mv.addObject(row+"con", 0);
			}
			
			
		}
		
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
	
	
	//��� �ۼ�
	@RequestMapping("/writerepl.do")
	@ResponseBody
	public String writeRepl( BoardVO vo,HttpSession session) {


		ReplNameVO re = new ReplNameVO(vo);
		vo.setB_boardname(re.changeName());
		vo.setId(((MemberVO) session.getAttribute("memberinfo")).getId());

		// ��� ����
		service.writeRepl(vo);

		return "success";

	}
	
	
	
	
	//��� ���
	@RequestMapping("/viewrepl.do")
	@ResponseBody
	public List<BoardVO> viewRepl(BoardVO vo,HttpSession session) {
		ReplNameVO re = new ReplNameVO(vo);
		vo.setB_boardname(re.changeName());
		List<BoardVO> result = (List<BoardVO>)service.viewBoardRepl(vo);


		return result;


	}
	//��� ��� 
		@RequestMapping("/viewreplpage.do")
		@ResponseBody
		public List<BoardVO> viewReplpage(BoardVO vo,HttpSession session) {
			ReplNameVO re = new ReplNameVO(vo);
			vo.setB_boardname(re.changeName());
			List<BoardVO> result = (List<BoardVO>)service.viewBoardRepl(vo);

			return result;

		}

	//������ ��� ���� ��������
	@RequestMapping("/getrepl.do")
	@ResponseBody
	public BoardVO getRepl(BoardVO vo) {
		
		ReplNameVO re = new ReplNameVO(vo);
		vo.setB_boardname(re.changeName());

		BoardVO result = (BoardVO)service.getRepl(vo);

		return result;

	}
	//��� ����
	@RequestMapping("/delrepl.do")
	@ResponseBody
	public void delRepl(BoardVO vo) {

		service.delRepl(vo);		

	}

	


	
	//��� ����
	@RequestMapping("/modifyrepl.do")
	@ResponseBody
	public void modifyRepl(BoardVO vo) {

		service.modifyRepl(vo);		

	}



	// �̹��� ���ε忡�� ����ϴ� ��Ʈ�ѷ�
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
		// ������ �ִ��� Ȯ��
		if (file != null) {
			// �����̸��� ������ Ȯ��
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {

				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						// �����̸� ��������
						String fileName = file.getName();
						// ���ϰ�������
						byte[] bytes = file.getBytes();
						// ������ ����
						String uploadPath = req.getRealPath("/")
								+ "resources\\uploadimage";
						// String uploadPath =
						// "C:\\Users\\Canon\\Documents\\GitHub\\final\\The_final_project\\src\\main\\webapp\\resources\\uploadimage";

						System.out.println(uploadPath);
						System.out.println(vo.getBoardname()+"�̹�������");
						System.out.println(vo.getBoardno()+"�Խñ۹�ȣ");//�ȳ���
						System.out.println(vo.getWriteno()+"�����۹�ȣ");//�ȳ���
						System.out.println(vo.getImgName()+"�̹����̸�");
						// ���丮 ����
						File uploadFile = new File(uploadPath);

						// ���ε��ϴ� ������ ��ΰ� ������ �����
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}

						// �����̸� ��������
						fileName = UUID.randomUUID().toString();

						// ���� ������������ ����
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = resp.getWriter();
						resp.setContentType("text/html");
						String fileUrl = req.getContextPath() + "\\resources\\uploadimage\\" + fileName;
						System.out.println(fileUrl);
						// �̹��� ������ ���¸� �����ϱ����� service ȣ�� �κ�

						// �� �Խ��ǿ� ���� �б⸦ ����
						
						 if (vo.getBoardname().equals("free_board")) {
		                     vo.setBoardno(BoardVO.FREE_BOARD);
		                  }else if(vo.getBoardname().equals("tip_board")) {
		                     vo.setBoardno(BoardVO.TIP_BOARD);
		                  }else if(vo.getBoardname().equals("parcel_board")) {
		                     vo.setBoardno(BoardVO.PARCEL_BOARD);
		                  }else if(vo.getBoardname().equals("nongsain")) {
		                     vo.setBoardno(BoardVO.NONGSAIN);
		                  }else if(vo.getBoardname().equals("in_repl")) {
		                     vo.setBoardno(BoardVO.IN_REPL);
		                  }

						vo.setImgName(fileName);
						service.storeImage(vo);
						// json �����ͷ� ���
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// �̷� ���·� ������ ��������.
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
	

	//�ۿ� ���ƿ� �� ������ ��
	@RequestMapping(value= "/likebad.do")
	@ResponseBody
	public String likeBad(BoardVO vo) {
		
		//����� ��� Ȯ��
		if(service.likeOrBad(vo)) {
			return "success";
			
			
			
		}else {
			return "false";
		}
			
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//�ۻ�����
	@RequestMapping("/deleteboard.do")
	public ModelAndView deleteboard(ModelAndView mv ,BoardVO vo) {
		
		service.deleteBoard(vo);
		System.out.println("��ۻ��� ����+^^^^^^^^^^^^^^^^");
		//mv.setViewName("redirect:/callboard.do?b_boardname="+vo.getB_boardname());
		mv.setViewName("redirect:/callboard.do?b_boardname="+vo.getB_boardname());
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
