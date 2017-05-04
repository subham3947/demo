

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;
/**
 * Servlet implementation class AddData
 */
@WebServlet("/AddData")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,maxFileSize = 1024*1024*10,maxRequestSize = 1024*1024*50)
public class AddData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "Images";
    private Connection conn;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDBConnection();
		String name = request.getParameter("name");
		String designation = request.getParameter("designation");
		String organization = request.getParameter("organization");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthdate");
		String bio = request.getParameter("bio");
		String imgPath = null;
		try{
			
			//Parsing Image
			String filepath = "D:"+File.separator+SAVE_DIR;
			File directory = new File(filepath);
			if(!directory.exists())
				directory.mkdir();
			Part part = request.getPart("file");
			String path = extractPath(part);
			String filename = path.substring(path.lastIndexOf("\\")+1,path.length());
		    imgPath = filepath+File.separator+filename;
			part.write(imgPath);
			
			//Writing Data to Database
			String sql_insert = "insert into DETAILS values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql_insert);
			ps.setString(1,name);ps.setString(2,designation);ps.setString(3,organization);
			ps.setString(4,address);ps.setString(5,phone);ps.setString(6,email);
			ps.setString(7,birthday);ps.setString(8,bio);ps.setString(9,imgPath);
			ps.execute();
			PrintWriter out = response.getWriter();
			out.print("Friend Added Successfully..");
			RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
			rd.include(request, response);
		}catch(Exception ex){}
	}
	
	private String extractPath(Part part){
		String Content_dis = part.getHeader("Content-Disposition");
		String[] items = Content_dis.split(";");
		for(String x : items){
			if(x.trim().startsWith("filename")){
				return x.substring(x.indexOf("=")+2,x.length()-1);
			}
		}
		return null;
	}
	
	private void getDBConnection(){
		try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			conn = DriverManager.getConnection("jdbc:db2://localhost:50000/CRM","WEBTEKLABS","webtek");
		}catch(Exception ex){}
	}
}
