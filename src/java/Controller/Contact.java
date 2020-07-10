package Controller;

import Model.DAO;
import Model.DAOFactory;
import Model.Message;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.DAO;


public class Contact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = DAOFactory.createRole("customer");

        int ID=0;
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String message = request.getParameter("message");

        Message messages = new Message(ID, email, fullname, message);
        dao.addMessage(messages);
        request.setAttribute("message", "Message Sent!");
        request.getRequestDispatcher("contact.jsp").include(request, response);
     }
}