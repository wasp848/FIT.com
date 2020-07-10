/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Card;
import Model.DAO;
import Model.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.DAO;

public class CustomerCard extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try {
         String command = request.getParameter("command");
         
         if (command==null)
         {
             command="ADDC";
         }
         
         switch (command)
            {
                case "ADDC" : addCard(request, response);break;
                case "REMOVEC" : removeCard(request, response);break;
                default : addCard(request, response);
            }
         } catch (Exception ex)     
         {
            ex.printStackTrace();
         }
    }

    private void addCard(HttpServletRequest request, HttpServletResponse response) 
    {
        try {
            DAO dao = DAOFactory.createRole("customer");
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String name = request.getParameter("name");
            String number = request.getParameter("number");
            String cvv = request.getParameter("cvv");
            String month = request.getParameter("month");
            String year = request.getParameter("year");
            String expiry = month + "/" + year;
            
            String checkCard = dao.checkAddCard(email,number);
            
            switch(checkCard)
            {
                case "Max": request.setAttribute("message", "Maximum number of cards added");break;
                
                case "Available": request.setAttribute("message", "Card already added");break;
                
                case "Continue":  dao.addCard(email, new Card(email, name, Long.parseLong(number), expiry, Integer.parseInt(cvv)));break;
                
                default: request.setAttribute("message", "Error adding card");break;
            }
            
            ArrayList<Card> cards = DAOFactory.createRole("visitor").getCustomerCard(email);
            session.setAttribute("cards", cards);
            response.sendRedirect("profile.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private void removeCard(HttpServletRequest request, HttpServletResponse response) throws ServletException 
    {
        try {
            DAO dao = DAOFactory.createRole("customer");
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String crd = request.getParameter("card");
            
            dao.removeCard(Long.parseLong(crd));
            
            ArrayList<Card> cards = DAOFactory.createRole("visitor").getCustomerCard(email);
            session.setAttribute("cards", cards);
            response.sendRedirect("profile.jsp");
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
        }
    }
}
