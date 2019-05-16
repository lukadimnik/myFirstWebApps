package Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student_database.Student;
import student_database.StudentDAO;

/**
 * Servlet implementation class StudentSearchServlet
 */
@WebServlet("/StudentSearchServlet")
public class StudentSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int givenId = -1;

		// 1. Retrieve the values of the request parameters
		String idText = request.getParameter("txtId");

		if (idText != null) {
			try {
				givenId = Integer.parseInt(idText);
			} catch (Exception ex) {

			}
		}

		// 2. Create the data to be sent to the JSP page
		StudentDAO studentDAO = null;
		try {
			studentDAO = new StudentDAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Student student = null;

		try {
			student = studentDAO.getStudentById(givenId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 3. Add the data to the request attributes
		request.setAttribute("student", student);
		request.setAttribute("txtId", idText);

		// 4. Forward the request back to the JSP page
		request.getRequestDispatcher("StudentSearch.jsp").forward(request, response);
	}

}
