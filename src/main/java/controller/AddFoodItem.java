package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MyDao;
import dto.FoodItem;
import dto.Hotel;

@WebServlet("/add-food-item")
@MultipartConfig
public class AddFoodItem extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("hotel") != null) {
			req.getRequestDispatcher("add-food-item.html").forward(req, resp);
		} else {
			resp.getWriter().print("<h1 align='center' style='color:red'>Invalid Session</h1>");
			req.getRequestDispatcher("hotel-login.html").include(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getSession().getAttribute("hotel") != null) {

			String name = req.getParameter("name");
			double price = Double.parseDouble(req.getParameter("price"));
			String type = req.getParameter("type");
			int stock = Integer.parseInt(req.getParameter("stock"));

			Part part = req.getPart("image");
			byte[] image = new byte[part.getInputStream().available()];
			part.getInputStream().read(image);

			FoodItem foodItem = new FoodItem();
			foodItem.setImage(image);
			foodItem.setName(name);
			foodItem.setPrice(price);
			foodItem.setStock(stock);
			foodItem.setType(type);

			Hotel hotel = (Hotel) req.getSession().getAttribute("hotel");
			foodItem.setHotel(hotel);
			MyDao dao = new MyDao();
			dao.saveFoodItem(foodItem);

			resp.getWriter().print("<h1 align='center' style='color:green'>Food Item Added Success</h1>");
			req.getRequestDispatcher("hotel-home.html").include(req, resp);
		} else {
			resp.getWriter().print("<h1 align='center' style='color:red'>Invalid Session</h1>");
			req.getRequestDispatcher("hotel-login.html").include(req, resp);
		}
	}
}
