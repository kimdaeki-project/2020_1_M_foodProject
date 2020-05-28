package com.food.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.food.project.geo.GeoVO;
import com.food.project.map.MapVO;
import com.food.project.market.MarketDAO;
import com.food.project.market.MarketService;
import com.food.project.market.MarketVO;
import com.food.project.member.MemberService;
import com.food.project.member.MemberVO;

@Controller
public class HomeController {
	
	@Autowired	
	private MarketDAO marketDAO;
	@Autowired
	private MarketService marketService;
	@Autowired
	private MemberService memberService;
	
	@Value("${kakao.map.appkey}")
	private String kakaoAppKey;
	
	@GetMapping("/search")
	@ResponseBody
	public List<MapVO> search(String str) throws Exception{
		System.out.println("str : "+str);
		
		ArrayList<MapVO> mapList = new ArrayList<MapVO>();
		MarketVO marketVO = new MarketVO();
		
		
		marketVO.setMarketName(str);
		System.out.println("marketList search");
		
		List<MarketVO> marketList = marketService.marketSearch(marketVO);
		for (MarketVO vo : marketList) {
			
			MapVO mapVO = new MapVO();
			
			MemberVO memberVO = new MemberVO();
			memberVO.setNum(vo.getUserNum());
			memberVO = memberService.memberSelect(memberVO);
			
			mapVO.setMarketVO(vo);
			mapVO.setLatitude(memberVO.getLatitude());
			mapVO.setLongitude(memberVO.getLongitude());
			
			mapList.add(mapVO);
		}

		return mapList;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) throws Exception{

		ModelAndView mv = new ModelAndView();
		
		// 내 주변 반경 정하기 ?? 추가 기능으로 넣자
		
		// 로그인을 안 했을시, Geolocation으로 위치 가져오기 (서울특별시 중심임을 알림)
		// 로그인을 했을 시, 주소 가져오기
		String address = "";
		MemberVO userVO = (MemberVO)session.getAttribute("memberVO");
		if(userVO == null) {
			address = getAddress(); //"서울특별시 마포구 월드컵북로 21";
		} else {
			address = userVO.getAddress();
		}
		
		System.out.println("get address : "+address);
		
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
		
		System.out.println("get address2 : "+marketVO.getAddress());
		
		// 마켓 정보들 가져오기(~구 검색)
		List<MarketVO> marketList = marketDAO.marketGuList(marketVO); //getMarketList();
		List<MapVO> mapList = new ArrayList<MapVO>();
		for (MarketVO vo : marketList) {
			// 이미지가 없다면 ""로 교체 (null이면 프론트에서 에러)
			if(vo.getThumbImg() == null)
				vo.setThumbImg("");
			
			// time 값을 교체
			vo.setOpenTime(convertTimeForm(vo.getOpenTime()));
			vo.setCloseTime(convertTimeForm(vo.getCloseTime()));
			
			MapVO mapVO = new MapVO();
			
			MemberVO memberVO = new MemberVO();
			memberVO.setNum(vo.getUserNum());
			memberVO = memberService.memberSelect(memberVO);
			
			mapVO.setMarketVO(vo);
			mapVO.setLatitude(memberVO.getLatitude());
			mapVO.setLongitude(memberVO.getLongitude());
			
			mapList.add(mapVO);
		
			System.out.println("\n========================");
			System.out.println(mapVO);
		}
		
		// 내 위치 보내기
		mv.addObject("address", address);
		
		// 마켓 정보 list 보내기
		mv.addObject("mapList", mapList);
		
		// 맵 api key 보내기
		mv.addObject("kakaoAppKey", kakaoAppKey);
		
		mv.setViewName("home");
		
		return mv;
	}

	//============================
	// 시간 포맷 변경해주기 (0900 -> 09:00)
	//============================
	public String convertTimeForm(String time) {
		
		String hour = time.substring(0,2);
		String min = time.substring(2,4);
		
		time = hour + ":" + min;
		
		return time;
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
