package com.food.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.geo.GeoDAO;
import com.food.project.geo.GeoVO;
import com.food.project.market.MarketDAO;
import com.food.project.market.MarketVO;
import com.food.project.member.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	private MarketDAO marketDAO;
	
	@Autowired
	private GeoDAO geoDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) throws Exception{

		ModelAndView mv = new ModelAndView();
		
		// 내 주변 반경 정하기 ?? 추가 기능으로 넣자
		
		// 로그인을 안 했을시, Geolocation으로 위치 가져오기 (서울특별시 중심임을 알림)
		// 로그인을 했을 시, 주소 가져오기
		String address = "";
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO == null) {
			address = getAddress(); //"서울특별시 중구 세종대로 110";
		} else {
			address = memberVO.getAddress();
		}
		
		// 유저의 위치 (~구 찾기)
		String[] addressInfo = address.split(" ");
		MarketVO marketVO = new MarketVO();
		for (int i = 0; i < addressInfo.length; i++) {
			
			// 주소에서 구만 가져옴
			if(addressInfo[i].length()-1 == addressInfo[i].lastIndexOf("구")) {
				
				marketVO.setAddress(addressInfo[i]);
				break;
			}
		}
		
		// 마켓 정보들 가져오기(~구 검색)
		List<MarketVO> marketList = marketDAO.marketGuList(marketVO); //getMarketList();
		for (MarketVO vo : marketList) {
			if(vo.getThumbImg() == null)
				vo.setThumbImg("");
		}
		
		// 해당되는 마켓들의 위치데이터(유저테이블의 Geo date)가져오기'
		System.out.println(marketVO.getAddress());
		List<GeoVO> geoList = geoDAO.geoList(marketVO); //getGeoList();
		System.out.println(geoList!=null?"not null":"null");
		
		// 마켓 및 Geo data 확인
//		for(int i=0; i<marketList.size(); i++) {
//			
//			GeoVO gvo = geoList.get(i);
//			MarketVO mvo = marketList.get(i);
//			System.out.println("NUM\t\tLatitude\t\tLongitude\t\tMarketName\t\tAddress");
//			System.out.print(gvo.getNum()+"\t\t");
//			System.out.print(gvo.getLatitude()+"\t\t");
//			System.out.print(gvo.getLongitude()+"\t\t");
//			System.out.print(mvo.getMarketName()+"\t\t");
//			System.out.println(mvo.getAddress());
//		}
		
		// 내 위치 보내기
//		System.out.println(address);
//		mv.addObject("address", address);
//		
//		// 마켓 위치 list로 보내기
//		mv.addObject("geoList", geoList);
//		
//		// 마켓 정보 list로 보내기
//		mv.addObject("marketList", marketList);
		
		mv.setViewName("home");
		
		return mv;
	}

	//============================
	// 유저 주소 가져오기
	//============================
	private String getAddress() {
		
		return "서울특별시 마포구 월드컵북로 21";
	}
	
	//============================
	// 마켓 위치 정보 가져오기
	//============================
	private GeoVO getGeoVO(double latitude, double longitude) {
		
		GeoVO geoVO = new GeoVO();
		
		geoVO.setLatitude(latitude);
		geoVO.setLongitude(longitude);
		
		return geoVO;
	}
	
	private List<GeoVO> getGeoList() {
		
		List<GeoVO> list = new ArrayList<GeoVO>();
		
		for(int i=1; i<=10; i++) {
			
			double latitude = 126919530;
			double longitude = 37556546;
			
			int n = 1;
			int m = 1;
			
			if(i%2 == 0)
				n *= -1;
			
			latitude += i*300*n;
			longitude += i*300*n;
			
			latitude /= 1000000.0;
			longitude /= 1000000.0;
			
			GeoVO geoVO = getGeoVO(latitude, longitude);
			
			list.add(geoVO);
		}
		
		return list;
	}
	
	//============================
	// 마켓 정보 가져오기
	//============================
	private MarketVO getMarketVO(
			int num, int userNum, String crn, String marketName, String openTime, String closeTime,
			int isOpen, int canOrder, String marketIntro, String thumbImg) {
		
		MarketVO marketVO = new MarketVO();
		
		marketVO.setNum(num);
		marketVO.setUserNum(userNum);
		marketVO.setCrn(crn);
		marketVO.setMarketName(marketName);
		marketVO.setOpenTime(openTime);
		marketVO.setCloseTime(closeTime);
		marketVO.setIsOpen(isOpen);
		marketVO.setCloseTime(closeTime);
		marketVO.setMarketIntro(marketIntro);
		marketVO.setThumbImg(thumbImg);
		
		return marketVO;
	}
	
	private List<MarketVO> getMarketList() {
		
		List<MarketVO> list = new ArrayList<MarketVO>();
		
		for(int i=0; i<10; i++) {
			
			int num = i+1;
			MarketVO marketVO = getMarketVO(num, num, ""+num, "푸드트럭"+num, "0900", "1800", 1, 1, "소개"+num, null);
			
			list.add(marketVO);
		}
		return list;
	}
}
