package com.food.project.auth;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class AuthService {

	@Value("${kakao.client_id}")
	private String client_id;
	
	@Value("${kakao.redirect_uri}")
	private String redirect_uri;
	
	public String getKakaoAccessToken (String authCode) throws Exception {
		
		System.out.println(client_id);
		System.out.println(redirect_uri);
		
		String accessToken = "";
        String refreshToken = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		if(conn == null) {
			System.out.println("kakao token server connect fail");
			throw new Exception();
		}
		
		// POST요청 세팅
		conn.setRequestMethod("POST");
		// Server 통신에서 출력 가능한 상태로 만듬 - Server와 통신을 하고자 할때는 반드시 위 두 method를 true로 해 놔야 함
		conn.setDoOutput(true);

		// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id="+client_id);
		sb.append("&redirect_uri="+redirect_uri);
		sb.append("&code=" + authCode);
		bw.write(sb.toString());
		bw.flush();

		// 결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);

		// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = "";
		String result = "";

		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response body : " + result);

		// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);

		accessToken = element.getAsJsonObject().get("access_token").getAsString();
		refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

		System.out.println("access_token : " + accessToken);
		System.out.println("refresh_token : " + refreshToken);

		br.close();
		bw.close();
        
        return accessToken;
    }
	
	public HashMap<String, Object> getKakaoUserInfo (String accessToken) throws Exception {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");

		// 요청에 필요한 Header에 포함될 내용 (Authorization 속성, 해당 값)
		conn.setRequestProperty("Authorization", "Bearer " + accessToken);

		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		String line = "";
		String result = "";

		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response body : " + result);

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);

		JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

		String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		String email = null;
		String gender = null;
		if(kakao_account.getAsJsonObject().has("email")) {
			email = kakao_account.getAsJsonObject().get("email").getAsString();
		}
		if(kakao_account.getAsJsonObject().has("gender")) {
			gender = kakao_account.getAsJsonObject().get("gender").getAsString();
		}
		
		userInfo.put("nickname", nickname);
		userInfo.put("email", email);
		userInfo.put("gender", gender);
	    
	    return userInfo;
	}
}

