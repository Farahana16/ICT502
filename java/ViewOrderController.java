package view.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import view.dao.ViewOrderDAO;
/**
 * Servlet implementation class ViewTicketController
 */
@WebServlet("/ViewOrderController")
public class ViewOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ViewOrderDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOrderController() {
        super();
        dao = new ViewOrderDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int orderdetailsid = Integer.parseInt(request.getParameter("orderdetailsid"));
		
		request.setAttribute("c", ViewOrderDAO.getViewById(1));
		RequestDispatcher view = request.getRequestDispatcher("ViewOrder.jsp");
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}