package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadAction")
public class downloadAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 요청 파라미터에서 파일 이름 가져오기
        String fileName = request.getParameter("file");
        
        // 파일이 위치한 디렉토리 경로 가져오기
        String directory = this.getServletContext().getRealPath("/upload/");
        
        // 다운로드할 파일을 나타내는 File 객체 생성
        File file = new File(directory + "/" + fileName);
        
        // 파일의 MIME 유형 가져오기
        String mimeType = getServletContext().getMimeType(file.toString());
        if (mimeType == null) {
            response.setContentType("application/octet-stream");
        }
        
        String downloadName = null;
        // user-agent(브라우저)를 기반으로 다운로드 이름 결정하기
        if (request.getHeader("user-agent").indexOf("MSIE") == -1) {
            downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
        } else {
            downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
        }
        
        // 응답 헤더를 설정하여 파일 다운로드 시작
        response.setHeader("Content-Disposition", "attachment;filename=\"" + downloadName + "\";");
        
        // 파일을 읽기 위해 입력 스트림 열기
        FileInputStream fileInputStream = new FileInputStream(file);
        
        // 파일 내용을 응답 출력 스트림에 쓰기 위해 출력 스트림 열기
        ServletOutputStream servletOutputStream = response.getOutputStream();
        
        byte b[] = new byte[1024];
        int data = 0;
        
        // 파일 내용을 읽고 응답 출력 스트림에 쓰기
        while ((data = (fileInputStream.read(b, 0, b.length))) != -1) {
            servletOutputStream.write(b, 0, data);
        }
        
        // 출력 스트림과 입력 스트림 플러시 및 닫기
        servletOutputStream.flush();
        servletOutputStream.close();
        fileInputStream.close();

    }
}