package com.food.project.geo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.food.project.market.MarketVO;

@Repository
public class GeoDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.food.project.geo.GeoDAO.";
	
	public List<GeoVO> geoList(MarketVO marketVO) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"geoList",marketVO);
	}
}
