/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAO;
import Model.DAOFactory;
import Model.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.DAO;

/**
 *
 * @author Khalid Fazal
 */
public class AdminOrders extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
         String command = request.getParameter("command");
         if (command==null)
         {
             command="VIEWO";
         }
         
         switch (command)
            {
                case "VIEWO" : adminDisplayAllOrders(request, response);break;
                case "UPDATEO" : adminUpdateOrders(request, response);break;
                default : adminDisplayAllOrders(request, response);
            }
         } catch (Exception ex)     {
            ex.printStackTrace();
        }
    }

    private void adminDisplayAllOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException 
    {
        try {
            DAO dao = DAOFactory.createRole("admin");
            List<Order> allOrders = dao.getAllOrders();
            request.setAttribute("orders", allOrders);
            request.getRequestDispatcher("manageorders.jsp").include(request, response);
        } catch (IOException|SQLException ex) {
            ex.printStackTrace();
        }
    }

    private void adminUpdateOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException 
    {
        try {
            DAO dao = DAOFactory.createRole("admin");
            int ID = Integer.parseInt(request.getParameter("orderID"));
            String status = request.getParameter("orderStatus");
            dao.updateOrder(ID, status);
            adminDisplayAllOrders(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
