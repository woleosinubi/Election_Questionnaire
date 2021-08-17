package app;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import data.Candidates;


@WebServlet(
    name = "Update",
    urlPatterns = {"/update"}
)
public class Update extends HttpServlet {
	private Dao dao;
	public void init() {
		dao=new Dao("jdbc:mysql://localhost:3307/electionmachine", "testuser", "password");
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
	     throws IOException {
		response.sendRedirect("index.html");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	     throws IOException, ServletException {
		String id=request.getParameter("id");
		String fullname=request.getParameter("fullname");
		String email=request.getParameter("email");
		String age=request.getParameter("age");
		String party=request.getParameter("party");
		String proffesion=request.getParameter("proffesion");
		
		Candidates Candi=new Candidates( id, fullname, email, age, party,proffesion);
		
		ArrayList<Candidates> list=null;
		if (dao.Connect()) {
			list=dao.updateCandidates(Candi);
		}
		
		request.setAttribute("candidateslist", list);
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/ShowCandidates.jsp");
		rd.forward(request, response);
	}
}