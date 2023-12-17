

import java.io.IOException;
import java.sql.*; // sql  
import java.io.IOException;
import java.io.File;  // 파일 처리를 위한 클래스
import java.io.FileInputStream;  // 파일 입력 스트림을 위한 클래스
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		// 사용자가 입력한 회원정보 가져오기
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// 기본 이미지 경로 설정
	    String defaultImagePath = "../img/defaultProfile.png"; // 웹 애플리케이션의 기본 프로필 이미지 경로
		
		// 유효성 체크
		
		if(username.isEmpty() || email.isEmpty() || password.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시키 바랍니다.");
			
		}
		// 데이터베이스 연결 
		Connection conn = null; 
		PreparedStatement pstmt = null;
		String user_info_sql = null;
	
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbc_url = "jdbc:mysql://localhost:3306/book_report_sharing?serverTimezone=UTC";
			conn = DriverManager.getConnection(jdbc_url, "root", "1234"); // 본인이 만든 데이터베이스 user, password
			user_info_sql = "INSERT INTO user_tbl (uemail, password, unickname, profileImg) VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(user_info_sql); // pstmt 객체 생성 
			
			pstmt.setString(1, email);
		    pstmt.setString(2, password); // 실제 환경에서는 비밀번호 암호화 필요
		    pstmt.setString(3, username);
		    pstmt.setString(4, defaultImagePath); // 기본 이미지 경로 설정

	
		    
		    // insert 실행 
		    int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            // 삽입 성공 처리
	        	response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉트
	        
	        } else {
	            // 삽입 실패 처리
	        	request.setAttribute("error", "데이터 삽입에 실패했습니다. 다시 시도해주세요.");
	        	request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
	        }
			
			
			
		} catch(Exception e) {
			System.out.println("DB 연동 오류 입니다. : " + e.getMessage()); 
		}// catch
		finally {
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}
		// 쿼리문 
		
		
		
		
		
	}// doPost

}
