package controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Customer;

@WebServlet("/customer-signup")
public class CustomerSignupServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("customer-signup.html").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		

		Customer customer = new Customer();
		customer.setAddress(address);
		customer.setEmail(email);
		customer.setMobile(mobile);
		customer.setName(name);
		customer.setPassword(password);

		MyDao dao=new MyDao();
		dao.saveCustomer(customer);

		resp.getWriter().print("<h1 align='center' style='color:green'>Account Created Success</h1>");
		req.getRequestDispatcher("customer-login.html").include(req, resp);

	}

}
