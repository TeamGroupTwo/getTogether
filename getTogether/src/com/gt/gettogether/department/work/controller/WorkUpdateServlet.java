package com.gt.gettogether.department.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.gt.gettogether.department.files.model.vo.Files;
import com.gt.gettogether.department.work.model.service.WorkService;
import com.gt.gettogether.department.work.model.vo.Work;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/update.wo")
public class WorkUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WorkUpdateServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	// -- 파일 처리용 Multipart Files 로직 작성부 -- //
    	
    	// 업로드 할 파일의 최대 용량을 제한
    	int maxSize =  1024 * 1024 * 10; // 10MB (1MB -> 1024KB / 1KB -> 1024Byte)
    	
    	// enctype="multipart/form-data" 로
    	// 전송된 것이 맞는지 확인하는 작업
    	if(!ServletFileUpload.isMultipartContent(request)) {
    		
    		// request.setAttribute("msg", "enctype을 지정하지 않았습니다.");
    		request.getRequestDispatcher("views/department/work/deptError.jsp").forward(request, response);
    		
    	}
    	
    	// 현재 웹 컨테이너의 기본 경로인
    	// 웹 애플리케이션의 루트 경로 설정
    	String root = request.getServletContext().getRealPath("/");
    	
    	// 업로드 될 파일이 저장될 폴더 명과 경로를 연결
    	// web/resources/bUploadFiles 폴더로 경로가 설정된다.
    	String fPath = root+"resources/files/workFiles";
    	
    	// 기존의 request 객체를 다양한 파일을 받기 위한
    	// MultipartRequest 객체로 변환해야 한다.
    	MultipartRequest mrequest = new MultipartRequest(
    			request, // 기존의 request 객체
    			fPath, // 서버 상에 업로드 될 경로 설정
    			maxSize, // 파일의 최대 사이즈 설정
    			"UTF-8", // 저장에 사용할 인코딩 설정
    			new DefaultFileRenamePolicy()
	    			// 만약에 동일한 이름의 파일이 있다면
	    			// 새로운 이름을 부여하여 기존의
	    			// 파일명과 구분하는 정책을 설정한다.
    				// 기본값은 OOO.txt --> OOO1.txt
    			);
    	
    	// -- 파일 처리용 Multipart Files 로직 작성부 -- //
    	
    	// 전달 받은 name 속성에 해당하는 파일을 지정된 경로에
    	// 저장하면서 해당 파일의 이름을 가져오는 메소드
    	String fName = mrequest.getFilesystemName("fileInput");
    	//String fName = mrequest.getParameter("fileName");
    	
    	Files f = new Files();
    	
    	f.setfName(fName);
    	f.setfPath(fPath);
    	
    	// ----------------------------------------------------//
    	
    	int wNo = Integer.parseInt(mrequest.getParameter("wNo"));
    	String wTitle = mrequest.getParameter("wTitle");
    	String wContent = mrequest.getParameter("wContent");
    	String wWriter = mrequest.getParameter("wWriter");
    	int pNo = Integer.parseInt(mrequest.getParameter("pNo"));
    	int eNo = Integer.parseInt(mrequest.getParameter("eNo"));
    	
		Work w = new Work();
		
		w.setwNo(wNo);
		w.setwTitle(wTitle);
		w.setwContent(wContent);
		w.setwWriter(wWriter);
		w.setpNo(pNo);
		w.seteNo(eNo);
		
		int result = new WorkService().updateWork(f, w);
		
		String pTitle = mrequest.getParameter("pTitle");
		
		String page = "";
		if(result > 0) {

			page = "selectList.wo?pNo="+pNo+"&pTitle="+pTitle+"&eNo="+eNo;
//			request.setAttribute("pNo", pNo);
//			request.setAttribute("pTitle", pTitle);
//			request.setAttribute("eNo", eNo);
			response.sendRedirect(page);
			
		} else {
			page = "views/department/deptError.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
