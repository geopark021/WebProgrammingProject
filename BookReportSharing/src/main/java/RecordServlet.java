import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/record")
public class RecordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RecordServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파라미터 'action'을 체크하여 어떤 단계의 처리인지 판단합니다.
        String action = request.getParameter("action");

        if ("saveContent".equals(action)) {
            // 첫 번째 단계: 사용자가 독후감을 작성하고 '다음 ->' 버튼을 클릭했을 때
            String bookName = request.getParameter("name");
            String content = request.getParameter("content");

            // 필요한 경우, 여기에서 bookName과 content를 처리합니다.
            // 예를 들면, 데이터베이스에 저장하는 로직을 추가할 수 있습니다.

            // 데이터를 세션에 저장합니다.
            HttpSession session = request.getSession();
            session.setAttribute("bookName", bookName);
            session.setAttribute("content", content);

            // 그림 선택 페이지로 리다이렉션합니다.
            response.sendRedirect("Bookreviewpage_picture.html");
        } else if ("savePicture".equals(action)) {
            // 두 번째 단계: 사용자가 그림을 선택하고 '다음 ->' 버튼을 클릭했을 때
            HttpSession session = request.getSession();
            String selectedPicture = request.getParameter("selectedPicture");

            // 세션에서 독후감 내용을 가져옵니다.
            String bookName = (String) session.getAttribute("bookName");
            String content = (String) session.getAttribute("content");

            // 필요한 경우, 여기에서 selectedPicture와 함께 데이터를 처리합니다.
            // 예를 들면, 데이터베이스에 저장하는 로직을 추가할 수 있습니다.

            // 모든 데이터가 준비되었으면, 결과를 recordbook.jsp로 전달합니다.
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/recordbook.jsp");
            dispatcher.forward(request, response);
        }
        // 그 외의 경우에 대한 처리를 추가할 수 있습니다.
    }
}
