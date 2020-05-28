package com.food.project.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.food.project.board.BoardService;
import com.food.project.board.BoardVO;
import com.food.project.fileInfo.FileInfoDAO;
import com.food.project.fileInfo.FileInfoVO;
import com.food.project.market.MarketVO;
import com.food.project.util.FileSaver;
import com.food.project.util.Pager;

@Service
@Transactional
public class ReviewService implements BoardService{

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FileInfoDAO fileInfoDAO;
	@Autowired
	private FileSaver fileSaver;
	
	
	//마켓의 전체 리뷰 목록 출력
	public List<ReviewVO> reviewMarketList(Pager pager) throws Exception{
		pager.makeRow();
		long marketNum = pager.getMarketNum();
		long totalCount = reviewDAO.marketReviewCount(marketNum);
		
		pager.makePage(totalCount);
		
		return reviewDAO.reviewMarketList(pager);
	}
	
	//이미지가 존재하는 리뷰의 전체 목록 조회
	public List<ReviewVO> imgTatalList(MarketVO marketVO) throws Exception{
		return reviewDAO.imgTatalList(marketVO);
	}
	
	//boardNum으로 하나의 리뷰 조회
	public ReviewVO reviewSelect(ReviewVO reviewVO) throws Exception {
		return reviewDAO.reviewSelect(reviewVO);
	}
	
	//한 계정이 등록한 리뷰목록 조회
	public List<ReviewVO> myReviewList(long memberNum) throws Exception{
		return reviewDAO.myReviewList(memberNum);
	}
	
	
	//한 마켓의 총 평점 계산
	public Double marketAvg(long marketNum) throws Exception{
		Double avg = reviewDAO.marketAvg(marketNum);
		if(avg == null) {
			avg = 0.0;
		}
		
		return avg;
	}
	
	//한 마켓의 전체 리뷰 개수 
	public int marketReviewCount(long marketNum) throws Exception{
		return reviewDAO.marketReviewCount(marketNum);
	}
	
	
	//덧글달기
	public int boardReply(ReviewVO reviewVO) throws Exception{
		long isReply = reviewDAO.boardSeq();
		
		System.out.println(isReply);
		
		reviewVO.setIsReply(isReply);
		int result = reviewDAO.boardReply(reviewVO);
		
		result = reviewDAO.isReplyUpdate(reviewVO);
		
		return result;
	}
	
	//리뷰리스트 출력
	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		System.out.println("Review Servcie _baordList");
		
		pager.makeRow();
		long marketNum = pager.getMarketNum();
		long totalCount = reviewDAO.marketReviewCount(marketNum);
		System.out.println("totalCount : "+totalCount);
		
		pager.makePage(totalCount);
		
		
		List<BoardVO> list = reviewDAO.boarList(pager);
		
		return list;
	}

	//리뷰 등록
	//@Override
	public int boardInsert(ReviewVO reviewVO,MultipartFile[] files,HttpSession session) throws Exception {
		String path = session.getServletContext().getRealPath("/resources/upload/review");
		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\review";
		//path="C:\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\review";  //집
		
		int result = 0;
		
		//review의 Num 값 구하기(시퀀스 사용)
		long num = reviewDAO.boardSeq();
		
		//HDD파일 등록
		//DB파일 등록
		//파일의 num을 리뷰VO의 파일num에 저장해줘야 함
		//DB리뷰 등록
		for (MultipartFile file : files) {
			//1.HDD등록
			String fileName = fileSaver.saveByUtils(file, path);
			//2.DB등록
			
			//파일 시퀀스 값 증가
			long fileNum = fileInfoDAO.fileCount();
			reviewVO.setFileName(fileName);
			

			FileInfoVO fileInfoVO = new FileInfoVO();
			fileInfoVO.setNum(fileNum);
			fileInfoVO.setFileName(fileName);
			fileInfoVO.setOriName(file.getOriginalFilename());
			fileInfoVO.setKind(2); //review
			fileInfoVO.setRefNum(num);
			
			result = fileInfoDAO.fileInfoInsert(fileInfoVO);
			
			if(result<1) {
				throw new Exception();
			}
		}
		
		reviewVO.setBoardNum(num);
		reviewVO.setRef(num);
		
		result = reviewDAO.boardInsert(reviewVO);
		
		return result;
	}
	
	//리뷰 수정
	public int boardUpdate(ReviewVO reviewVO,MultipartFile[] files,HttpSession session) throws Exception {
		String path = session.getServletContext().getRealPath("/resources/upload/review");
		path="C:\\tm\\workspaceSTS\\foodProject\\src\\main\\webapp\\resources\\upload\\review";
		
		int result = 0;
		
		if(files.length != 0) {
			for (MultipartFile file : files) {
				//1.HDD등록
				String fileName = fileSaver.saveByUtils(file, path);
				reviewVO.setFileName(fileName);
				
				//2.DB등록
				//파일 시퀀스 값 증가
				long fileNum = fileInfoDAO.fileCount();

				FileInfoVO fileInfoVO = new FileInfoVO();
				fileInfoVO.setNum(fileNum);
				fileInfoVO.setFileName(fileName);
				fileInfoVO.setOriName(file.getOriginalFilename());
				fileInfoVO.setKind(2); //review
				fileInfoVO.setRefNum(reviewVO.getBoardNum());
				
				result = fileInfoDAO.fileInfoInsert(fileInfoVO);
				System.out.println("fileUpdate result : "+ result);
				
				if(result<1) {
					throw new Exception();
				}
			}
		}
		
		result = reviewDAO.boardUpdate(reviewVO);
		System.out.println("리뷰 업로드 결과 : "+result);
		
		
		return result;
	}
	//덧글 수정
	public int boardUpdate(ReviewVO reviewVO) throws Exception {
		reviewVO.setRating(0);
		reviewVO.setFileName(null);		
		
		int result = reviewDAO.boardUpdate(reviewVO);
		return result;
	}

	//리뷰 삭제
//	@Override
	public int boardDelete(BoardVO boardVO) throws Exception {
		return reviewDAO.boardDelete(boardVO);
	}

	

	
}
