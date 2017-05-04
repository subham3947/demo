

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.Date;

/**
 * Servlet implementation class Comments
 */
@WebServlet("/Comments")
public class Comments extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out = null;
	private HttpSession session;
	private Connection conn = null;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDBConnection();
		Date date = new Date();
		String comment = request.getParameter("comment");
		comment = date.toString() + "\n" + "\t" + comment + "\n\n\n";
		out = response.getWriter();
	    session = request.getSession(false);
		String name_p = (String)session.getAttribute("name");
		try{
			PreparedStatement ps = conn.prepareStatement("insert into COMMENT_T values(?,?)");
			ps.setString(1,name_p);
			ps.setString(2,comment);
			ps.execute();
			/*RequestDispatcher ds = request.getRequestDispatcher("info.jsp?name = Ramu");
			ds.forward(request, response);*/
			response.sendRedirect("info.jsp?name="+name_p);
		}catch(Exception ex){}
	}
	
	public void getDBConnection(){
		try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			conn = DriverManager.getConnection("jdbc:db2://localhost:50000/CRM","WEBTEKLABS","webtek");
		}catch(Exception ex){}
	}

}
