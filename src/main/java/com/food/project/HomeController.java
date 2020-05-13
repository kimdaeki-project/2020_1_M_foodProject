package com.food.project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.geo.GeoVO;
import com.food.project.market.MarketVO;
import com.food.project.member.MemberVO;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {

		ModelAndView mv = new ModelAndView();
		
		// 내 주변 반경 정하기
		
		// 내 위치 가져오기
		// 내 주소 (~시)
		String address = getAddress();
		
		// 마켓 위치(유저테이블의 Geo date)가져오기
		List<GeoVO> geoList = getGeoList();
		
		// 마켓 정보들 가져오기(~시 검색) 
		List<MarketVO> marketList = getMarketList();	
		for (MarketVO marketVO : marketList) {
			if(marketVO.getThumbImg() == null)
				marketVO.setThumbImg("");
		}
		
		// 내 위치 보내기
		mv.addObject("address", address);
		
		// 마켓 위치 list로 보내기
		mv.addObject("geoList", geoList);
		
		// 마켓 정보 list로 보내기
		mv.addObject("marketList", marketList);
		
		
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
		
		for(int i=1; i<=12; i++) {
			
			double latitude = 126919530;
			double longitude = 37556546;
			
			int n = 1;
			int m = 1;
			
			if(i%2 == 0)
				n *= -1;
			
			if(i%3 == 0)
				m *= -1;
			
			latitude += i*300*n;
			longitude += i*300*m;
			
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
