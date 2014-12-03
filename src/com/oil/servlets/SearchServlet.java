package com.oil.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	
	int cid;
	String cadd;
	String czip;
	int choiceid;

	private static final long serialVersionUID = 1L;

	String search_query1 = "SELECT * FROM client  WHERE id=?";
	/*String search_query2 = "select c.id, c.userid, c.fname, c.lname, c.emailid, c.cellnum, c.phnum, c.oilbalance, c.cashbalance"
			+ " from client c, livesin l\r\n"
			+ "where l.stname like \"%?%\"\r\n" 
			+ "and l.clientid=c.id";
			*/
	String search_query2 = "select c.id, c.userid, c.fname, c.lname, c.emailid, c.cellnum, c.phnum, c.oilbalance, c.cashbalance from client c, livesin l where l.stname like ? and l.clientid=c.id";
	String search_query3 = "select c.id, c.userid, c.fname, c.lname, c.emailid, c.cellnum, c.phnum, c.oilbalance, c.cashbalance\r\n"
			+ "from address a, client c, livesin l\r\n"
			+ "where a.zipcode like ? \r\n"
			+ "and a.stname = l.stname \r\n"
			+ "and l.clientid= c.id";
	
	public SearchServlet() {
		super();
	
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hi");
	
		System.out.println("Data received frm search JSP: Choice: "
				+ request.getParameter("searchby") + "\tClientID: "
				+ request.getParameter("cid") + "\tAddress: "
				+ request.getParameter("caddress").toString() + "\tZipcode: "
				+ request.getParameter("czip"));
			
			choiceid = Integer.parseInt(request.getParameter("searchby").toString());
			
			System.out.println("Choice id is --->:"+ choiceid);
			
			
		  try {
		  
		  Connection con1 = (Connection) getServletContext().getAttribute("DBConnection");
		  
		  PreparedStatement ps = null; ResultSet rs = null;
		  
		  @SuppressWarnings("unused")
		HttpSession session = request.getSession();
		  
			System.out.println("Choice ID:"+choiceid);	
			
		  if ( choiceid == 1) { 
			  
			  cid = Integer.valueOf(request.getParameter("cid").toString());
			  System.out.println("Entered 1");
			  ps = con1.prepareStatement(search_query1); 
			  ps.setInt(1, cid);
			  rs = ps.executeQuery();
			  
		  System.out.println("Result: " + rs.toString());
		  
		  Result result = ResultSupport.toResult(rs);
		  request.setAttribute("result", result); 
		  RequestDispatcher rd = request .getRequestDispatcher("/search.jsp"); 
		  rd.forward(request, response);
		  
		  } else if ( choiceid == 2) { 
			  cadd = request.getParameter("caddress").toString();
			  System.out.println("entering 2");
			  ps = con1.prepareStatement(search_query2);
			  ps.setString(1, "%" +cadd +"%");
			  rs = ps.executeQuery();
			  System.out.println(cadd);

		  System.out.println("Result" + rs.toString());
		  
		  Result result = ResultSupport.toResult(rs);
		  request.setAttribute("result", result); RequestDispatcher rd =
		  request .getRequestDispatcher("/search.jsp"); rd.forward(request,
		  response);
		  
		  } else if ( choiceid == 3) { 
			  
				czip = request.getParameter("czip").toString();
			  System.out.println("entering 3");
			  ps = con1.prepareStatement(search_query3); 
			  ps.setString(1, "%" +czip +"%");
			  rs = ps.executeQuery();
		  
		  System.out.println("Result" + rs.toString());
		  
		  Result result = ResultSupport.toResult(rs);
		  request.setAttribute("result", result); RequestDispatcher rd =
		  request .getRequestDispatcher("/search.jsp"); rd.forward(request,
		  response);
		  
		  }
		  
		  
		  } catch (Exception e) {
		  
		  e.printStackTrace(); }
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
