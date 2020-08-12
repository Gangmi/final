package com.kos.service;

import java.io.File;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.kos.dao.BoardDao;

import com.kos.vo.BoardVO;
import com.kos.vo.PagingVO;
import com.kos.vo.PlantVO;
import com.kos.vo.UploadImageVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		// TODO Auto-generated method stub

		return dao.getBoardList(vo);

	}

	@Override
	public void writeBoard(BoardVO vo) {
		// TODO Auto-generated method stub

		dao.writeBoard(vo);

	}

	@Override
	public BoardVO viewBoard(BoardVO vo) {

		return dao.viewBoard(vo);
	}

	@Override
	public void storeImage(UploadImageVO imgvo) {
		dao.storeImage(imgvo);

	}

	public void writeRepl(BoardVO vo) {
		dao.writeRepl(vo);

	}

	public void storeProfile(UploadImageVO vo) {
		dao.storeProfile(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {

		return dao.updateBoard(vo);
	}

	public void deleteBoard(BoardVO vo) {

		try {
			dao.deleteBoard(vo);
		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void delRepl(BoardVO vo) {
		dao.delRepl(vo);

	}

	public void modifyRepl(BoardVO vo) {
		dao.modifyRepl(vo);

	}

	public BoardVO getRepl(BoardVO vo) {

		return dao.getRepl(vo);
	}

	public List<BoardVO> viewBoardRepl(BoardVO vo) {
		// 댓글의 총 갯수를 가져온다.
		int replnum = dao.viewBoardReplCount(vo);
		// 댓글 페이징할떄 필요한 값들을 넣어준다.

		PagingVO page = new PagingVO(replnum, vo.getNowpage(), vo.getViewing_replcount());
		// 게시판 이름과 게시글번호
		page.setB_boardname(vo.getB_boardname());
		page.setBoardno(vo.getBoardno());
		List<BoardVO> result = dao.viewBoardRepl(page);
		if (result.size() != 0) {
			result.get(0).setNowpage(page.getLastPage());// 페이징 버튼 만들 떄 필요
		}
		return result;
	}

	// 좋아요싫어요를 올리는 곳

	public boolean likeOrBad(BoardVO vo) {
		String rawBoardName = vo.getB_boardname();
		// 먼저 좋아요 싫어요를 누른적이 있는지 검사
		int result = dao.detectLikeOrBad(vo);
		System.out.println("좋아요 싫어요 클릭한 적이 있음?" + result);

		// 누른적이 없다면 db업데이트를 시작
		if (result == 0) {
			// 원래의 boardname으로 설정
			vo.setB_boardname(rawBoardName);

			try {
				// vo를 dao로 전달
				int updatedone = dao.updateLikeBad(vo);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 누른적이 있다면,
		} else {
			return false;
		}
		// 정상적으로 다 됐다면
		return true;

	}


	// 답글 목록
	public List<BoardVO> AnswerList(BoardVO vo) {
		List<BoardVO> result = dao.AnswerList(vo);
		return result;
	}

	public void deleteAnswer(BoardVO vo) {
		System.out.println(vo.getB_boardname() + " 서비스");
		System.out.println(vo.getBoardno() + " 서비스");
		try {
			dao.deleteAnswer(vo);
		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int updateAnswer(BoardVO vo) {

		return dao.updateAnswer(vo);
	}

	public List<BoardVO> writerview(BoardVO vo) {
		return dao.writerview(vo);
	}

	// 프로필 사진 이미지가 있는지 확인하고 삭제하는 메소드
	public boolean isThereProfile(UploadImageVO vo) {

		// 먼저 아이디로 있는지부터 확인
		String imagename = dao.isThereProfile(vo);

		// 있다면, 해당이름을 가진 파일을 삭제
		if (imagename!=null) {
			String filePath = "D:\\springwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\The_final_project\\resources\\profileimg\\";

			File deleteFile = new File(filePath + imagename);

			// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
			if (deleteFile.exists()) {

				// 파일을 삭제합니다.
				try {
					deleteFile.delete();
				} catch (Exception e) {

				}
				System.out.println("파일을 삭제하였습니다.");
				return true;
			} else {
				System.out.println("파일이 존재하지 않습니다.");
				return true;
			}

		}else {
			//만약 없다면 return false
			return false;
		}






	}
	//이미 등록된 사진이 있을 때 갈아끼우는 용도
	public void updateProfile(UploadImageVO vo) {
		dao.updateProfile(vo);

	}




	public void updateCheteck(BoardVO vo) {
		dao.updateCheteck(vo);    
	}


	public BoardVO AnswerCheteck(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.AnswerCheteck(vo);
	}

	public void cancleCheteck(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.cancleCheteck(vo);
	}

	public List<BoardVO> getPost(PagingVO vo) {

		//만약 세팅된 시작값이 없다면
		if(vo.getStart()==0) {
			vo.setStart(1);
			vo.setEnd(3);
		}


		return dao.getPost(vo);



	}


	public List<BoardVO> adminChart(BoardVO vo) {
		return dao.adminChart(vo);

	}

	public BoardVO adminPieChart(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.adminPieChart(vo);
	}   


}