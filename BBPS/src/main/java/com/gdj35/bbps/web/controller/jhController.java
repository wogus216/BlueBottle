package com.gdj35.bbps.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj35.bbps.common.bean.PagingBean;
import com.gdj35.bbps.common.service.IPagingService;
import com.gdj35.bbps.util.Utils;
import com.gdj35.bbps.web.service.IjhService;

@Controller
public class jhController {
	
	@Autowired
	public IjhService ijhService;
	
	@Autowired
	public IPagingService iPagingService;

//로그인 페이지
	
// 로그인 다 구현하면 아이디에 맞게 링크 걸어 놓기
	@RequestMapping(value="/Login")
	public ModelAndView Login(
			ModelAndView mav) {
		
		mav.setViewName("jh/Login");
		
		return mav;
		
	}
	//본사 로그인
	@RequestMapping(value="/H_Login")
	public ModelAndView hq_Login(HttpSession session, ModelAndView mav) {
			if(session.getAttribute("sUSERNo") != null	) { //로그인상태
				mav.setViewName("redirect:Ord_Mang");
			} else { // 비 로그인 상태
				mav.setViewName("jh/H_Login");
			}
			
			return mav;
	}
	
		
	@RequestMapping(value="/H_Logins",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String H_Logins(
		HttpSession session,
		@RequestParam HashMap<String, String> params) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	//암호화
	//params.put("hPw", Utils.encryptAES128(params.get("hPw")));
	
	//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("hPw")));
	
	
	HashMap<String, String> data = ijhService.getHQ(params);
	
	System.out.println("로그인data :"+ data);
	if(data != null) { //사용자 정보가 있음
		session.setAttribute("sUSERNo", data.get("USER_NO")); //유저번호
		session.setAttribute("sAUTHNo", data.get("AUTH_NO")); //권한번호
		session.setAttribute("sDEPNo", data.get("DEP_NO"));	// 부서 번호
		session.setAttribute("sDEPNo", data.get("DEP_NO"));	// 권한타입 번호
		session.setAttribute("sId", data.get("ID")); // 아이디
		System.out.println("유저번호:"+session.getAttribute("sUSERNo"));
		
		
		modelMap.put("resMsg", "success");
	} else { // 사용자 정보가 없음
		modelMap.put("resMsg", "failed");
		
	}
	return mapper.writeValueAsString(modelMap);
	
	}
	
	//로그아웃
	@RequestMapping(value="/H_LogOut")
	public ModelAndView H_LogOut(HttpSession session,
			ModelAndView mav) {
		System.out.println(session.getAttribute("sDEPNo"));
		session.invalidate();
		
		mav.setViewName("redirect:H_Login");
		return mav;
	}
	
	//본사메뉴
	@RequestMapping(value="/H_Menu")

	public ModelAndView H_Menu(
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		System.out.println("유저권한번호:"+session.getAttribute("sAUTHNo"));
		mav.setViewName("jh/H_Menu");
			
		return mav;
	}
	
	@RequestMapping(value="/H_Menus",
	method = RequestMethod.POST,
	produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String H_Menus(
	HttpSession session,
	@RequestParam HashMap<String, String> params) throws Throwable{
			
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();
	params.put("hAuthNo", String.valueOf(session.getAttribute("sAUTHNo")));
	params.put("hDt", "1");
	
	System.out.println("H_menus에서 권한번호:"+session.getAttribute("hAuthNo"));
	
	// 메뉴 취득
	List<HashMap<String, String>>menu= ijhService.getHMenu(params);
	
	modelMap.put("menu", menu);
	
	System.out.println("본사menu 보자"+menu);
	return mapper.writeValueAsString(modelMap);
	}
	
	
	//POS메뉴관리
	 @RequestMapping(value="/Menu_List")
	 public ModelAndView Menu_List(
			 @RequestParam HashMap<String, String> params,
			 ModelAndView mav) {

		 int page = 1;

		 if(params.get("page") != null) {
			 page = Integer.parseInt(params.get("page"));
		 }

		 mav.addObject("page", page);
		 mav.setViewName("jh/Menu_List");

		 return mav;

	 }
	
	@RequestMapping(value="/Menu_Lists",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Menu_Lists(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		// 현재 페이지
		int page = Integer.parseInt(params.get("page"));
		
		// 총 게시글 수 
		int cnt = ijhService.getMbCnt(params);
			
		// 페이징 정보 취득
		PagingBean pb= iPagingService.getPagingBean(page, cnt, 10, 5);
			
		//글번호 P 없으면 글번호
		//게시글 시작번호, 종료번호 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
			
		// 메뉴목록 취득
		List<HashMap<String, String>>list= ijhService.getMbList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		System.out.println("페이지"+params);
		System.out.println("list 목록 보자"+list);
		return mapper.writeValueAsString(modelMap);
			
	}
	
	//메뉴 상세보기
	@RequestMapping(value="/Menu_Dtl")
	public ModelAndView Menu_Dtl(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = ijhService.getMd(params);
			
		/*
		 * if(Integer.parseInt(String.valueOf(data.get("EFLAG"))) == 1) {
		 * 
		 * String path = "resources/upload/"+data.get("MIMG"); data.put("MIMG", path); }
		 */
		System.out.println("상세보기 데이터"+data);
		mav.addObject("data", data);
		mav.setViewName("jh/Menu_Dtl");
		return mav;
	}
	
	//메뉴 수정
	
	@RequestMapping(value="/Menu_Edit")
	public ModelAndView Menu_Edit(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		HashMap<String, String> data = ijhService.getMd(params);
		
		/*
		 * if(Integer.parseInt(String.valueOf(data.get("EFLAG"))) == 1) {
		 * 
		 * String path = "resources/upload/"+data.get("MIMG"); data.put("MIMG", path); }
		 */
		mav.addObject("data", data);
		System.out.println("수정 데이터 보자"+data);
		mav.setViewName("jh/Menu_Edit");
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/Menu_Imgs",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
			@ResponseBody 
			public String Menu_Imgs(
				@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			System.out.println("이미지파람스"+params);
			
		/*
		 * if(Integer.parseInt(String.valueOf(params.get("img_Cnt"))) == 0) { String
		 * path = "resources/upload/"+params.get("m_File"); params.put("m_File", path);
		 * }
		 */
			try {
				int cnt = ijhService.editM(params);
				
				if(cnt > 0) {
					modelMap.put("msg", "success");
					
				} else {
					modelMap.put("msg", "failed");
				}
				
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("msg", "error");
			}
			return mapper.writeValueAsString(modelMap);
			
			}
	
	@RequestMapping(value="/Menu_Edits",
	method = RequestMethod.POST,
	produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String Menu_Edits(
		@RequestParam HashMap<String, String> params) throws Throwable {
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
		int cnt = ijhService.editM(params);
		
		if(cnt > 0) {
			modelMap.put("msg", "success");
			
		} else {
			modelMap.put("msg", "failed");
		}
		
	} catch (Throwable e) {
		e.printStackTrace();
		modelMap.put("msg", "error");
	}
	return mapper.writeValueAsString(modelMap);
	
	}
	
	
	//메뉴 추가
	@RequestMapping(value ="/Menu_Add")
	public ModelAndView Menu_Add(ModelAndView mav) {

		mav.setViewName("jh/Menu_Add");

		return mav;

	}
	
	
	@RequestMapping(value="/Menu_Adds",
		method = RequestMethod.POST,
		produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String Menu_Adds(
		HttpSession session,
		@RequestParam HashMap<String, String> params) throws Throwable {
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	System.out.println("Menu_Adds에서본사유저번호:"+session.getAttribute("sUSERNo"));
	try {
		
		int cnt = ijhService.addM(params);
		
		if(cnt > 0) {
			modelMap.put("msg", "success");
			
		} else {
			modelMap.put("msg", "failed");
		}
		
	} catch (Throwable e) {
		e.printStackTrace();
		modelMap.put("msg", "error");
	}
	return mapper.writeValueAsString(modelMap);
	
	}
	
	//삭제
	
	@RequestMapping(value="/Menu_Dels",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String Menu_Dels(
	@RequestParam HashMap<String, String> params) throws Throwable {
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
	int cnt = ijhService.delM(params);
	
	if(cnt > 0) {
	modelMap.put("msg", "success");
	
	} else {
	modelMap.put("msg", "failed");
	}
	
	} catch (Throwable e) {
	e.printStackTrace();
	modelMap.put("msg", "error");
	}
	
	
	return mapper.writeValueAsString(modelMap);
	
	}
	
	//본사 마이페이지
	
	@RequestMapping(value="/My_Page")
	public ModelAndView My_Page(
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		params.put("sUSERNo", String.valueOf(session.getAttribute("sUSERNo")));
		try {
			
			HashMap<String, String> data = ijhService.getHUser(params);
			mav.addObject("data", data);
			System.out.println("마이페이지"+data);
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jh/My_Page");
		System.out.println("유저번호:"+session.getAttribute("sUSERNo"));
		return mav;
		
	}
	
	
	//비밀 번호 체크
	@RequestMapping(value="/pw_Checks",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String pw_Checks(
			HttpSession session,
		@RequestParam HashMap<String, String> params) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	//암호화
	//params.put("hPw", Utils.encryptAES128(params.get("hPw")));
	
	//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("hPw")));
	
	params.put("sUSERNo", String.valueOf(session.getAttribute("sUSERNo")));
	
	//암호화
	//params.put("hPw", Utils.encryptAES128(params.get("hPw")));
	
	//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("hPw")));
	
	HashMap<String, String> data = ijhService.getHPw(params);
	
	System.out.println("비밀번호data :"+ data);
	if(data != null) { //사용자 정보가 있음
		modelMap.put("msg", "success");
		
	} else { // 사용자 정보가 없음pw_Checks
		modelMap.put("msg", "failed");
		
	}
	return mapper.writeValueAsString(modelMap);
	
	}
	
	
	//마이페이지 수정
	
		@RequestMapping(value="/My_Page_Edit")
		public ModelAndView My_Page_Edit(
				@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
			
			HashMap<String, String> data = ijhService.getHUser(params);
			
			mav.addObject("data", data);
			System.out.println("마이페이지수정"+data);
			mav.setViewName("jh/My_Page_Edit");
			return mav;
		}
		
	

	@RequestMapping(value="/My_Page_Edits",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
			@ResponseBody 
			public String My_Page_Edits(
				@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				//암호화
				//params.put("hPw", Utils.encryptAES128(params.get("hPw")));
				
				//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("hPw")));
				
				int cnt = ijhService.editHU(params);
				
				if(cnt > 0) {
					modelMap.put("msg", "success");
					
				} else {
					modelMap.put("msg", "failed");
				}
				
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("msg", "error");
			}
			return mapper.writeValueAsString(modelMap);
			
			}
	
//***********************************지점***********************************************	
	
	
	//지점 로그인
	
	@RequestMapping(value="/B_Login")
	public ModelAndView b_Login(HttpSession session, ModelAndView mav) {
			if(session.getAttribute("sBRCHNo") != null	) { //로그인상태
				mav.setViewName("redirect:B_Stock_List");
			} else { // 비 로그인 상태
				mav.setViewName("jh/B_Login");
			}
			
			return mav;
	}
	
	@RequestMapping(value="/B_Logins",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String b_Logins(
		HttpSession session,
		@RequestParam HashMap<String, String> params) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();

	//암호화
	//params.put("bPw", Utils.encryptAES128(params.get("bPw")));
	
	//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("bPw")));
	
	HashMap<String, String> data = ijhService.getB(params);
	
	System.out.println("data :"+ data);
	if(data != null) { //사용자 정보가 있음
		session.setAttribute("sBRCHNo", data.get("BRCH_NO")); //지점번호
		session.setAttribute("sAUTHNo", data.get("AUTH_NO")); //지점권한번호
		session.setAttribute("sId", data.get("ID")); //지점 아이디
		session.setAttribute("sBRCHNm", data.get("BRCH_NAME")); //지점명
		System.out.println(session.getAttribute("sBRCHNm")); //지점장 이름
		
		modelMap.put("resMsg", "success");
	} else { // 사용자 정보가 없음
		modelMap.put("resMsg", "failed");
		
	}
	return mapper.writeValueAsString(modelMap);
	
	}
	
	//로그아웃
		@RequestMapping(value="/B_LogOut")
		public ModelAndView b_LogOut(HttpSession session,
				ModelAndView mav) {
			System.out.println(session.getAttribute("sBRCHNm"));
			session.invalidate();
			
			
			mav.setViewName("redirect:B_Login");
			return mav;
		}
		
		
		// 지점 메뉴	
		@RequestMapping(value="/B_Menu")
					
			public ModelAndView b_Menu(
					HttpSession session,
						ModelAndView mav) {
			System.out.println("지점이름:"+session.getAttribute("sBRCHNm"));
				mav.setViewName("jh/B_Menu");
						
					return mav;
			}
		
		@RequestMapping(value="/B_Menus",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
				
				@ResponseBody
				public String B_Menus(
				HttpSession session,
				@RequestParam HashMap<String, String> params) throws Throwable{
						
				ObjectMapper mapper = new ObjectMapper();
				
				Map<String, Object> modelMap = new HashMap<String, Object>();
				params.put("BrNm", String.valueOf(session.getAttribute("sBRCHNm")));
				params.put("bDt", "1");
				
				System.out.println("B_menus에서 지점이름:"+session.getAttribute("sBRCHNm"));
				
				// 메뉴 취득
				List<HashMap<String, String>>menu= ijhService.getBMenu(params);
				
				modelMap.put("menu", menu);
				
				System.out.println("지점menu 보자"+menu);
				return mapper.writeValueAsString(modelMap);
				
				}
		
		
		//지점 마이페이지
		
			@RequestMapping(value="/B_My_Page")
			public ModelAndView B_My_Page(
					HttpSession session,
					@RequestParam HashMap<String, String> params,
					ModelAndView mav) {
				
				try {
					
					HashMap<String, String> data = ijhService.getBUser(params);
					mav.addObject("data", data);
					System.out.println("지점마이페이지"+data);
					
				} catch (Throwable e) {
					e.printStackTrace();
				}
				
				mav.setViewName("jh/B_My_Page");
				System.out.println("유저번호:"+session.getAttribute("sBRCHNo"));
				return mav;
				
			}
			
			
			
			//지점 비밀 번호 체크
			@RequestMapping(value="/b_Pw_Checks",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String b_Pw_Checks(
					HttpSession session,
				@RequestParam HashMap<String, String> params) throws Throwable{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			//암호화
			//params.put("bPw", Utils.encryptAES128(params.get("bPw")));
			
			//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("bPw")));
			
			HashMap<String, String> data = ijhService.getBPw(params);
			
			System.out.println("비밀번호data :"+ data);
			if(data != null) { //사용자 정보가 있음
				modelMap.put("msg", "success");
				
			} else { // 사용자 정보가 없음pw_Checks
				modelMap.put("msg", "failed");
				
			}
			return mapper.writeValueAsString(modelMap);
			
			}
			
			//마이페이지 수정
			
			@RequestMapping(value="/B_My_Page_Edit")
			public ModelAndView B_My_Page_Edit(
					@RequestParam HashMap<String, String> params,
					ModelAndView mav) throws Throwable {
				
				HashMap<String, String> data = ijhService.getBUser(params);
				
				mav.addObject("data", data);
				System.out.println("지점마이페이지수정"+data);
				mav.setViewName("jh/B_My_Page_Edit");
				return mav;
			}

			@RequestMapping(value="/B_My_Page_Edits",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
					@ResponseBody 
					public String B_My_Page_Edits(
						@RequestParam HashMap<String, String> params) throws Throwable {
					ObjectMapper mapper = new ObjectMapper();
					Map<String, Object> modelMap = new HashMap<String, Object>();
					
					try {
						//암호화
						//params.put("bPw", Utils.encryptAES128(params.get("bPw")));
						
						//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("bPw")));
						
						int cnt = ijhService.editBU(params);
						
						if(cnt > 0) {
							modelMap.put("msg", "success");
							
						} else {
							modelMap.put("msg", "failed");
						}
						
					} catch (Throwable e) {
						e.printStackTrace();
						modelMap.put("msg", "error");
					}
					return mapper.writeValueAsString(modelMap);
					
					}
		
		
	//포스 로그인
		
		@RequestMapping(value="/Pos_Login")
		public ModelAndView Pos_Login(HttpSession session, ModelAndView mav) {
				if(session.getAttribute("sBRCHNo") != null	) { //로그인상태
					mav.setViewName("redirect:Pos");
				} else { // 비 로그인 상태
					mav.setViewName("jh/Pos_Login");
				}
				
				return mav;
		}
		@RequestMapping(value="/Pos_Logins",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String Pos_Logins(
			HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//암호화
		//params.put("bPw", Utils.encryptAES128(params.get("bPw")));
		
		//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("bPw")));
		
		HashMap<String, String> data = ijhService.getB(params);
		
		System.out.println("data :"+ data);
		if(data != null) { //사용자 정보가 있음
			session.setAttribute("sBRCHNo", data.get("BRCH_NO"));
			session.setAttribute("sId", data.get("ID"));
			session.setAttribute("sBRCHNm", data.get("BRCH_NAME"));
			session.setAttribute("sMGRNm", data.get("MGR_NAME"));
			System.out.println(session.getAttribute("sBRCHNm"));
			
			modelMap.put("resMsg", "success");
		} else { // 사용자 정보가 없음
			modelMap.put("resMsg", "failed");
			
		}
		return mapper.writeValueAsString(modelMap);
		
		}
		
	//로그아웃
		@RequestMapping(value="/Pos_LogOut")
		public ModelAndView Pos_LogOut(HttpSession session,
				ModelAndView mav) {
			System.out.println(session.getAttribute("sBRCHNm"));
			session.invalidate();
				
			mav.setViewName("redirect:Pos_Login");
			return mav;
		}	
			

		

	//포스
	
	@RequestMapping(value="/Pos")
	
	public ModelAndView Pos(
			HttpSession session,
				ModelAndView mav) {
		System.out.println("Pos에서 지점이름:"+session.getAttribute("sBRCHNm"));
		
		mav.setViewName("jh/Pos");
				
			return mav;
	}
	
	
	@RequestMapping(value="/Poss",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
			
	@ResponseBody
	public String Poss(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		System.out.println("포스params"+params);
		//메뉴 목록 취득
		List<HashMap<String, String>> list = ijhService.getPMenu(params);
		
		System.out.println("포스메뉴 보자list"+list);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
				
		}
	
	@RequestMapping(value="/PosOrd",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String PosOrd(
		@RequestParam HashMap<String, String> params) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	System.out.println("오더Params"+params);
	// 오더 취득
	HashMap<String, String>ord= ijhService.getMOrd(params);
	
	modelMap.put("ord", ord);
	
	System.out.println("오더 목록 보자"+ord);
	return mapper.writeValueAsString(modelMap);
		
	}
	
	
	//주문 번호 생성
	
		@RequestMapping(value="/makeOrdNo",
		method = RequestMethod.POST,
		produces = "text/json;charset=UTF-8")
		
		@ResponseBody
		public String makeOrdNo() throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 오더 취득
		HashMap<String, String>ordNum= ijhService.getOrdNum();
		
		modelMap.put("ordNum", ordNum);
		System.out.println("주문 번호 보자"+ordNum);
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//주문 금액 넣기
	
		@RequestMapping(value="/input_Moneys",
						method = RequestMethod.POST,
						produces = "text/json;charset=UTF-8")
	
		@ResponseBody 
		public String input_Moneys(
			HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			System.out.println("주문금액보자"+params);
			
			int cnt = ijhService.addSales(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
				
			} else {
				modelMap.put("msg", "failed");
			}
			
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		return mapper.writeValueAsString(modelMap);
		
		}
		
	
	//주문 세일즈 메뉴에 넣기
	
		@RequestMapping(value="/input_Menus",
						method = RequestMethod.POST,
						produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String input_Menus(
				@RequestParam ArrayList<String> menuNo, //jsp에 있는 네임값과 일치해야한다
				@RequestParam ArrayList<String> oMCnt,
				@RequestParam ArrayList<String> ordNo) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String,Object> insertMap = new HashMap<String, Object>();
			System.out.println("메뉴번호"+menuNo);
				try {
						//오더 번호는 하나 이기때문에 굳이 for문이 필요없다.
						insertMap.put("ordNo", ordNo.get(0));
						
					for(int i = 0; i < menuNo.size(); i++) {
						insertMap.put("menuNo", menuNo.get(i));
						insertMap.put("oMCnt", oMCnt.get(i));
						
						System.out.println("결제품목목록보자"+ insertMap);
						
						int cnt = ijhService.addOrd(insertMap);
					
					if(cnt > 0) {
						
						modelMap.put("msg", "success");
					} else {
						
						modelMap.put("msg", "failed");
						}
					}
					
				} catch (Throwable e) {
					e.printStackTrace();
					
					modelMap.put("msg", "error");
				}
				
				return mapper.writeValueAsString(modelMap);
		}
		//환불 리스트 불러오기
		
		
		@RequestMapping(value="/ref_Lists",
		method = RequestMethod.POST,
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String ref_Lists(
		@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		//현재페이지
		try {
			
			int page = 1;
			
			if(params.get("page") != null) {
				
				page=Integer.parseInt(params.get("page"));
				
			}
			
			//총 게시글 수
			int cnt = ijhService.getRCnt(params);
			
			// 페이징 정보 취득
				PagingBean pb= iPagingService.getPagingBean(page, cnt, 10, 5);
						
			//글번호 P 없으면 글번호
			//게시글 시작번호, 종료번호 할당
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			System.out.println("환불리스트params"+params);
			//메뉴 목록 취득
			List<HashMap<String, String>> list = ijhService.getRList(params);
			
			System.out.println("환불날자list"+list);
			modelMap.put("list", list);
			modelMap.put("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
			
		}
}
