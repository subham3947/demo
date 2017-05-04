

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDBConnection();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sql_search = "select * from LOGIN where USERNAME = ? and PASSWORD = ?";
		try{
			PreparedStatement ps = conn.prepareStatement(sql_search);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet s = ps.executeQuery();
			if(s.next()){
				HttpSession session = request.getSession();
				session.setAttribute("UN",username);
				RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
				rd.forward(request, response);
			}else{
				PrintWriter pw = response.getWriter();
				pw.println("User not Registered");
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.include(request, response);
			}
		}catch(Exception ex){}
	}
	
	public void getDBConnection(){
		String driver = "com.ibm.db2.jcc.DB2Driver";
		String url = "jdbc:db2://localhost:50000/CRM";
		String username = "WEBTEKLABS";
		String password = "webtek";
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
		}catch(Exception ex){}
	}

}
