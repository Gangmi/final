package com.kos.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.BoardVO;
import com.kos.vo.ImageDetectVO;
import com.kos.vo.PagingVO;
import com.kos.vo.UploadImageVO;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {

		// 전체 페이지수 구하기(vo board name)

		// 해당 게시판 전체 게시물 갯수 구하기
		int total = mybatis.selectOne("board.getBoardCount", vo);
		PagingVO page = new PagingVO(total, vo.getNowpage(), vo.getViewing_count());

		System.out.println(page.getLastPage());

		// 현재페이지와 보여지는 갯수에따른 게시물 검색(hashmap)
		page.setBoardname(vo.getB_boardname());
		List<BoardVO> result = mybatis.selectList("board.getBoardList", page);

		// nowpage멤버변수를 이용해서 total page를 저장
		if (result.size() > 0) {
			result.get(0).setNowpage(page.getLastPage());
		}

		return result;

	}

	@Override
	public void writeBoard(BoardVO vo) {
		HashMap hs = new HashMap();

		// 게시판 분기 나누기
		int boardno = 0;
		if (vo.getB_boardname().equals("free_board")) {
			boardno = 1;
		}
		hs.put("boardno", boardno);

		// 게시판 이름 가져오기
		hs.put("boardname", vo.getB_boardname());

		// 저장될 글번호 가져오기
		int writeno = mybatis.selectOne("board.getNextNum", hs);
		hs.put("writeno", writeno);

		// 저장상태가 바뀔 이미지가 있는지 확인
		List<UploadImageVO> result = mybatis.selectList("isthereimg", hs);

		// 저장상태 바꿀 이미지가 있다면, update함
		if (result.size() > 0) {
			mybatis.update("notemp", hs);
		}
		// 글 저장
		System.out.println(vo.getTitle());
		System.out.println(vo.getContents());
		mybatis.insert("board.writeboard", vo);

	}

	@Override
	public BoardVO viewBoard(BoardVO vo) {
		// 조회수올리기
		mybatis.update("board.upviewcount", vo);
		BoardVO result = mybatis.selectOne("board.viewboard", vo);
		result.getBoardView();

		return result;
	}

	@Override
	public void storeImage(UploadImageVO imgvo) {
		HashMap hs = new HashMap();
		hs.put("boardname", imgvo.getBoardname());
		// 만약 글을 새로쓰는것이면, 다음에 해당 게시판에 들어갈 글번호 부르기
		if (imgvo.getWriteno() == 0) {
			int writeno = mybatis.selectOne("board.getNextNum", hs);
			mybatis.insert("board.imagestore", imgvo);

			// 글을 수정하는것이면, 현재 글의 번호로 이미지를 저장
		} else {
			mybatis.update("board.imagestore", imgvo);

		}

	}

	public void writeRepl(BoardVO vo) {
		System.out.println("board.writerepl");
		mybatis.insert("board.writerepl", vo);
	}

	public List<BoardVO> viewBoardRepl(BoardVO vo) {
		// TODO Auto-generated method stub

		return mybatis.selectList("board.viewBoardRepl", vo);
	}

	// 게시판 글 수정시에
	@Override
	public int updateBoard(BoardVO vo) {
		// 게시판 정보를 통해서 해당 글의 이미지 정보를 찾기 위한 클래스
		ImageDetectVO dec = new ImageDetectVO(vo);

		HashMap hs = dec.detecting();
		// 저장상태가 바뀔 이미지가 있는지 확인
		List<UploadImageVO> result = mybatis.selectList("isthereimg", hs);

		// 저장상태 바꿀 이미지가 있다면, update함
		if (result.size() > 0) {
			mybatis.update("notemp", hs);
		}

		return mybatis.update("board.updateboard", vo);
	}

	@Override
	//글 삭제시에
	public void deleteBoard(BoardVO vo) {
		//트랜잭션 처리를 위한 오토 커밋 false
		//mybatis.getSqlSessionFactory().openSession(false);
		
		//댓글 삭제
		mybatis.delete("board.deletereple", vo);
		
		//글삭제
		mybatis.delete("board.deleteboard",vo);

		//이미지파일 삭제
		// 파일의 경로 + 파일명
//        String filePath = "D:\\springwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\The_final_project\\/resources/uploadimage";
//        
//        File deleteFile = new File(filePath);
// 
//        // 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
//        if(deleteFile.exists()) {
//            
//            // 파일을 삭제합니다.
//            deleteFile.delete(); 
//            
//            System.out.println("파일을 삭제하였습니다.");
//            
//        } else {
//            System.out.println("파일이 존재하지 않습니다.");
//        }
//		
//		
//		//db이미지 삭제
//		mybatis.delete("board.deleteboard", vo);
		
		
		
		//글삭제

	}

}
