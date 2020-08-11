package com.kos.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kos.vo.BoardVO;
import com.kos.vo.ImageDetectVO;
import com.kos.vo.PagingVO;
import com.kos.vo.ReplNameVO;
import com.kos.vo.UploadImageVO;

@Repository("BoardDao")
public class BoardDaoImpl implements BoardDao {

   @Autowired
   private SqlSessionTemplate mybatis;

   @Override
   public List<BoardVO> getBoardList(BoardVO vo) {

      // 전체 페이지수 구하기(vo board name)

      // 해당 게시판 전체 게시물 갯수 구하기
      int total = mybatis.selectOne("board.getBoardCount", vo);
      System.out.println("토탈갯수"+total);
      PagingVO page = new PagingVO(total, vo.getNowpage(), vo.getViewing_count());
      if(vo.getSearchword()!=null) {
         System.out.println("검색어로 조회 들어옴");
         page.setSearchword(vo.getSearchword());
      }
      System.out.println(page.getSearchword());
      System.out.println(page.getLastPage());

      // 현재페이지와 보여지는 갯수에따른 게시물 검색(hashmap)
      page.setBoardname(vo.getB_boardname());
      
      System.out.println(page.getStart()+"시작페이지~~~~~~~~~~~");
      System.out.println(page.getEnd());
      
      List<BoardVO> result = mybatis.selectList("board.getBoardList", page);

      // nowpage멤버변수를 이용해서 total page를 저장
      if (result.size() > 0) {
         result.get(0).setNowpage(page.getLastPage());
         result.get(0).setBlock(page.getNowblock());
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
      System.out.println(vo.getB_boardname());
      
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
      if(vo.getB_boardname().equals("in_repl")) {
         mybatis.insert("board.writeAnswer", vo);
      }else {
         mybatis.insert("board.writeboard", vo);
      }
      

   }
//   @Override
//   public void writeBoard(BoardVO vo) {
//      HashMap hs = new HashMap();
//
//      // 게시판 분기 나누기
//      int boardno = 0;
//      if (vo.getB_boardname().equals("free_board")) {
//         boardno = 1;
//      }
//      hs.put("boardno", boardno);
//
//      // 게시판 이름 가져오기
//      hs.put("boardname", vo.getB_boardname());
//      System.out.println(vo.getB_boardname());
//      // 저장될 글번호 가져오기
////      int writeno = mybatis.selectOne("board.getNextNum", hs); 필요 없다
////      hs.put("writeno", writeno);
//
//      // 저장상태가 바뀔 이미지가 있는지 확인
//      List<UploadImageVO> result = mybatis.selectList("isthereimg", hs);
//
//      // 저장상태 바꿀 이미지가 있다면, update함
//      if (result.size() > 0) {
//         mybatis.update("notemp", hs);
//      }
//      // 글 저장
//      System.out.println(vo.getTitle());
//      System.out.println(vo.getContents());
//      mybatis.insert("board.writeboard", vo);
//

//	}

	@Override
	public BoardVO viewBoard(BoardVO vo) {
		// 조회수올리기
		mybatis.update("board.upviewcount", vo);
		BoardVO result = mybatis.selectOne("board.viewboard", vo);

		return result;
	}

	@Override
	public void storeImage(UploadImageVO imgvo) {
		HashMap hs = new HashMap();
		hs.put("boardname", imgvo.getBoardname());
		System.out.println(imgvo.getBoardname()+"이미지저장");
		System.out.println(imgvo.getBoardno()+"게시글번호");
		System.out.println(imgvo.getWriteno()+"다음글번호");
		System.out.println(imgvo.getImgName()+"이미지이름");
		// 만약 글을 새로쓰는것이면, 다음에 해당 게시판에 들어갈 글번호 부르기
		if (imgvo.getWriteno() == 0) {
			int writeno = mybatis.selectOne("board.getNextNum", hs);
			imgvo.setWriteno(writeno);
			mybatis.insert("board.imagestore", imgvo);

			// 글을 수정하는것이면, 현재 글의 번호로 이미지를 저장
		} else {
			mybatis.update("board.imagestore", imgvo);

		}

	}
	//댓글 작성
	public void writeRepl(BoardVO vo) {
		mybatis.insert("board.writerepl", vo);
	}
	public int viewBoardReplCount(BoardVO vo) {
		return mybatis.selectOne("board.viewBoardReplCount", vo);
	}
	//댓글 가져오기
	public List<BoardVO> viewBoardRepl(PagingVO vo) {
		return mybatis.selectList("board.viewBoardRepl", vo);
	}
	//댓글삭제
	public void delRepl(BoardVO vo) {
		mybatis.delete("board.deleterepl2", vo);
	}
	//댓글수정
	public void modifyRepl(BoardVO vo) {
		mybatis.update("board.modifyRepl", vo);
	}

	public BoardVO getRepl(BoardVO vo) {
		BoardVO result = mybatis.selectOne("board.getRepl", vo);
		return result;

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

	@Transactional(rollbackFor={Exception.class})
	public void deleteBoard(BoardVO vo) throws Exception {
		
		// mybatis.getSqlSessionFactory().openSession(false);
		System.out.println(vo.getB_boardname()+" dao");
			
		
		System.out.println("=============delete 시작===========");
		String rawboardname = vo.getB_boardname();
		// 댓글 검색 및 삭제를 위해 그에 맞는 이름으로 boardname을 변경
		ReplNameVO re = new ReplNameVO(vo);
		vo.setB_boardname(re.changeName());

		// 삭제할 댓글이 있는지를 먼저 확인
		int replcnt = mybatis.selectOne("countrepl", vo);

		System.out.println(replcnt + "댓글갯수");

		// 만약 댓글이있으면
		if (replcnt > 0) {
			System.out.println("댓글이있다");
			// 댓글을 삭제
			int result = mybatis.delete("board.deleterepl", vo);
			System.out.println(result);
			// 만약 댓글이 있는데 삭제가 안되면, 멈춤
			if (result < 1) {
				System.out.println("댓글 삭제가 안됐다");
				throw new Exception();
			}
		}

		vo.setB_boardname(rawboardname);
		
		// 글을 삭제
		int deletecon = mybatis.delete("deleteboard", vo);
		// 만약 글이 삭제되지 않으면
		if (deletecon < 1) {
			throw new Exception();
		}

		// 이미지 테이블의 해당 글 번호를 가진 이미지 정보를 가져옴
		ImageDetectVO img = new ImageDetectVO(vo);
		HashMap hs = img.detecting();
		List<UploadImageVO> imginfo = mybatis.selectList("selectimg", hs);

		// 만약 이미지가 있으면
		if (imginfo.size() > 0) {
			for (UploadImageVO row : imginfo) {
				
				String filePath = "D:\\springwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\The_final_project\\resources\\uploadimage\\";

				File deleteFile = new File(filePath+row.getImgName());

				// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
				if (deleteFile.exists()) {

					// 파일을 삭제합니다.
					try {
					deleteFile.delete();
					}catch(Exception e){
						
					}
					System.out.println("파일을 삭제하였습니다.");
					
					

				} else {
					System.out.println("파일이 존재하지 않습니다.");
					
				}
				

			}
		}
		// db이미지 기록 삭제
		mybatis.delete("board.deleteimage",hs);
		
		
		// 글삭제

	}
	
	//해당글에 좋아요 싫어요를 했는지 확인하는 메소드
	
	//좋아요 싫어요를 한 기록이 있는지확인
	@Override
	public int detectLikeOrBad(BoardVO vo) {
		vo.setB_boardname((BoardVO.getBoardnoByBoardname(vo)));
		
		System.out.println(vo.getB_boardname());
		System.out.println(vo.getBoardno());
		System.out.println(vo.getId());
		int result=mybatis.selectOne("detectLikeOrBad",vo);
			
		return result;
	}
	
	//좋아요 싫어요올리는 메소드
	@Transactional(rollbackFor={Exception.class})
	@Override
	public int updateLikeBad(BoardVO vo) throws Exception {
		//이 메소드가 정상적으로 실행되었는지 확인하기위한 변수
		int isItOk=1;
		//board data base에 저장된 좋아요 싫어요를 업데이트
		int result=mybatis.update("board.updateLikeBad",vo);
		
		//만약 업데이트 되지 않았다면 예외를 던져 롤백처리
		if(result==0) {
			throw new Exception();
			
		//업데이트 되었다면, 해당 아이디가 좋아요 / 싫어요를 눌렀다는 db에 insert
		}else {
			vo.setB_boardname(BoardVO.getBoardnoByBoardname(vo));
			
			int updateManage=mybatis.insert("board.insertLikeBad", vo);
			
			//만약 매니지 테이블에 insert실패시
			if(updateManage==0) {
				throw new Exception();
			}
			//위의 항목들이 정상적으로 실행됐을 경우
		isItOk=0;
			
		}
		
		return isItOk;
		
		
		
	}
	
	public List<BoardVO> AnswerList(BoardVO vo){
		List<BoardVO> result = mybatis.selectList("board.AnswerList", vo);
		return result;
		
	}
	
	@Transactional(rollbackFor={Exception.class})
	public void deleteAnswer(BoardVO vo) throws Exception {
		
		// mybatis.getSqlSessionFactory().openSession(false);
		System.out.println(vo.getB_boardname()+" dao");
		System.out.println(vo.getBoardno());
		System.out.println(vo.getReplno());

		// 글을 삭제
		System.out.println(vo.getB_boardname()+"  dao!");
		int deletecon = mybatis.delete("deleteAnswer", vo);
		// 만약 글이 삭제되지 않으면
//		if (deletecon < 1) {
//			throw new Exception();
//		}

		// 이미지 테이블의 해당 글 번호를 가진 이미지 정보를 가져옴
		ImageDetectVO img = new ImageDetectVO(vo);
		HashMap hs = img.detecting();
		List<UploadImageVO> imginfo = mybatis.selectList("selectimgAnswer", hs);

		// 만약 이미지가 있으면
		if (imginfo.size() > 0) {
			for (UploadImageVO row : imginfo) {
				
				String filePath = "D:\\springwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\The_final_project\\resources\\uploadimage\\";

				File deleteFile = new File(filePath+row.getImgName());

				// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
				if (deleteFile.exists()) {

					// 파일을 삭제합니다.
					try {
					deleteFile.delete();
					}catch(Exception e){
						
					}
					System.out.println("파일을 삭제하였습니다.");
					
					

				} else {
					System.out.println("파일이 존재하지 않습니다.");
					
				}
				

			}
		}
		// db이미지 기록 삭제
		mybatis.delete("board.deleteimageAnswer",hs);
		
		
		// 글삭제

	}

//	 답글 수정
		@Override
		public int updateAnswer(BoardVO vo) {
			// 게시판 정보를 통해서 해당 글의 이미지 정보를 찾기 위한 클래스
			ImageDetectVO dec = new ImageDetectVO(vo);
			HashMap hs = dec.detecting();
			// 저장상태가 바뀔 이미지가 있는지 확인
			List<UploadImageVO> result = mybatis.selectList("isthereimg", hs);

			// 저장상태 바꿀 이미지가 있다면, update함
			if (result.size() > 0) {
				mybatis.update("notemp", hs);
			}

			return mybatis.update("board.updateAnswer", vo);
		}
	
		//채택하기
		public void updateCheteck(BoardVO vo) {
			mybatis.update("board.updateCheteck", vo);
		}
	
		//채택한 것만 가져오기
		public BoardVO AnswerCheteck(BoardVO vo) {
			return mybatis.selectOne("board.AnswerCheteck", vo);
			
		}
		
		//채택 취소하기
		public void cancleCheteck(BoardVO vo) {
			 mybatis.selectOne("board.cancleCheteck", vo);
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void storeProfile(UploadImageVO vo) {
		mybatis.insert("insertprofile", vo);
	}
	
	@Override
	public List<BoardVO> writerview(BoardVO vo) {
		System.out.println("===> mybatis writerview() 호출");  
		return mybatis.selectList("board.writerview", vo);   
	}
	//프로필사진이 있는지 확인하고 들고옴
	@Override
	public String isThereProfile(UploadImageVO vo) {
		return mybatis.selectOne("isthereprofile", vo);
		
	}

	//프로필사진이 있다면 update
	@Override
	public void updateProfile(UploadImageVO vo) {
		mybatis.update("updateprofileimg", vo);
		
	}
	//사진포스팅을 가져오는 메소드
	@Override
	public List<BoardVO> getPost(PagingVO vo) {
		
		
		
		
		
		return mybatis.selectList("getpost", vo);
	}   
	
	
	
	 
	 
	
	
	
	
	
	
	
	
	
}

