package com.gt.gettogether.notice.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.gt.gettogether.notice.model.service.NoticeService;
import com.gt.gettogether.notice.model.vo.NoticeNFiles;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;;


@WebServlet("/update.no")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public NoticeUpdateServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// -- 첨부 파일 업로드용 로직 작성부 -- //
		
				// 업로드할 파일의 용량을 제한 (10MB)
				int maxSize = 1024 * 1024 * 10;
				
				// enctype 으로 전달이 되었는지 확인
				if(!ServletFileUpload.isMultipartContent(request)){
					request.setAttribute("msg", "form-data 타입으로 전송해야 합니다");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
				// 웹 루트 경로 확보
				String root = request.getServletContext().getRealPath("/");
				
				// 업로드 되는 파일이 저장 될 폴더 생성 및 경로 설정
				// web/resources/bUploadFiles
				String savePath = root + "resources/files/noticeFiles";
				
				// request. ---> MultipartRequest
				MultipartRequest mrequest = new MultipartRequest(
						request,
						savePath,
						maxSize,
						"UTF-8",
						new DefaultFileRenamePolicy());
						
				
				// -- 첨부 파일 업로드용 로직 작성부 -- //
				
				NoticeService nService = new NoticeService();
				
				String title = mrequest.getParameter("title");
				String content = mrequest.getParameter("content");
				int nno = Integer.parseInt(mrequest.getParameter("nno"));
				String fileName = mrequest.getFilesystemName("f_NameSend");
				
				NoticeNFiles nf = new NoticeNFiles();
				
				nf.setnTitle(title);
				nf.setnContent(content);
				nf.setnNo(nno);
				nf.setfName(fileName);
				nf.setfPath(savePath);
				
				int result = new NoticeService().updateNotice(nf);
				
				String page = "";
				
				if(result > 0) {
					
					nf = nService.selectUpdateOne(String.valueOf(nno));
					page = "views/notice/noticeDetail.jsp";
					request.setAttribute("n", nf);
			
					
				}		
				request.getRequestDispatcher(page).forward(request, response);
				
//				NoticeNFiles n = nService.updateNotice(n);
//				
//				n.setnNo(Integer.parseInt(nno));
//				n.setnTitle(title);
//				n.setnContent(content);
//				
//				if(fileName != null) {
//					File originFile = new File(savePath + "/" + n.getfName());
//					
//					originFile.delete();
//					
//					n.setfName(fileName);
//				}
//				
//				System.out.println(n);
//				
//				int result = nService.updateNotice(n);
//				
//			
//				
//				String page = "";
//				
//				if(result > 0) {
//					
//					n = nService.selectOne(nno);
//					page = "views/notice/NoticeDetail.jsp";
//					request.setAttribute("n", n);
//			
//					
//				}		
//				request.getRequestDispatcher(page).forward(request, response);

		/*String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		System.out.println("nno 값을 알고싶습니다. :" +nno);
		
		NoticeNFiles n = new NoticeNFiles();
		n.setnTitle(title);
		n.setnContent(content);
		n.setnNo(nno);
		
		int result = new NoticeService().updateNotice(n);
		
		String page="";
		if(result > 0){
			page = "views/notice/noticeDetail.jsp";
			request.setAttribute("n", new NoticeService().selectOne(String.valueOf(nno)));
			
			
			
		}
		request.getRequestDispatcher(page).forward(request, response);*/
		
		
		
		
		
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
