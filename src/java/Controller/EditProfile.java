/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAO;
import Model.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.DAO;

public class EditProfile extends HttpServlet 
{
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try {
         String command = request.getParameter("command");
         
         if (command==null)
         {
             command="UPDC";
         }
         
         switch (command)
            {
                case "UPDC" : updateContactNumber(request, response);break;
                default : updateContactNumber(request, response);
            }
         } catch (Exception ex) {
            ex.printStackTrace();
         }
    }

    private void updateContactNumber(HttpServletRequest request, HttpServletResponse response) 
    {
         try {
             DAO dao = DAOFactory.createRole("customer");
             HttpSession session = request.getSession();
             String email = (String) session.getAttribute("email");
             long number = Long.parseLong(request.getParameter("updateContact"));
             
             dao.updateNumber(email,number);
             session.setAttribute("contact", number);
             request.getRequestDispatcher("profile.jsp").include(request, response);
         } catch (SQLException ex) {
             ex.printStackTrace();
         } catch (ServletException | IOException ex) {
             ex.printStackTrace();
         }
    }
}
