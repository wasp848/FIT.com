package Controller;

import Model.Card;
import Model.DAO;
import Model.DAOFactory;
import Model.Item;
import Model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.DAO;


public class Login extends HttpServlet {
    String result, name;
    long contact;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = DAOFactory.createRole("visitor");
        
        String mail = request.getParameter("mail");
        String password = request.getParameter("pwd");
        ArrayList <Item> cart = new ArrayList<>();
        
        try 
        {
            User theUser = new User(mail,password) {};
            
            try {
                result = dao.authenticateUser(theUser);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        
            switch (result)
            {
                case "Customer":
                {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", mail);
                    name = dao.getCustomerName(mail);
                    contact = dao.getCustomerContact(mail);
                    ArrayList<String> addresses = dao.getCustomerAddress(mail);
                    ArrayList<Card> cards = dao.getCustomerCard(mail);
                    session.setAttribute("fullname", name);
                    session.setAttribute("contact", contact);
                    session.setAttribute("addresses", addresses);
                    session.setAttribute("cards", cards);
                    session.setAttribute("cart", cart);
                    request.setAttribute("loginmessage", "Login success!");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                    break;
                }
                case "Admin":
                {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", mail);
                    name = dao.getAdminName(mail);
                    session.setAttribute("fullname", name);
                    response.sendRedirect("adminhome.jsp");
                    break;
                }
                case "Invalid":
                {
                    request.setAttribute("loginmessage", "Invalid credentials!");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                    break;
                }
            }
        } catch (IOException | SQLException ex)
        {
            ex.printStackTrace();
        }
    }
}
