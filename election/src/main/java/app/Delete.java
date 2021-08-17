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
    name = "Delete",
    urlPatterns = {"/delete"}
)
public class Delete extends HttpServlet {
	private Dao dao;
	public void init() {
		dao=new Dao("jdbc:mysql://localhost:3307/electionmachine", "testuser", "password");
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
	     throws IOException, ServletException {
		String id=request.getParameter("id");
		ArrayList<Candidates> list=null;
		if (dao.Connect()) {
			list=dao.deleteCandidates(id);
		}
		request.setAttribute("candidateslist", list);
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/ShowCandidates.jsp");
		rd.forward(request, response);
	}
}