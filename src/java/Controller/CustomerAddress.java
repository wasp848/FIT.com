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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.DAO;

public class CustomerAddress extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try {
         String command = request.getParameter("command");
         
         if (command==null)
         {
             command="ADDA";
         }
         
         switch (command)
            {
                case "ADDA" : addAddress(request, response);break;
                case "REMOVEA" : removeAddress(request, response);break;
                default : addAddress(request, response);
            }
         } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void addAddress(HttpServletRequest request, HttpServletResponse response) 
    {
        try {
            DAO dao = DAOFactory.createRole("customer");
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String addr = request.getParameter("address");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            String postal = request.getParameter("postal");
            
            String checkAddress = dao.checkAddress(email);
            
            if (checkAddress != null)
            {
                String address = checkAddress + "|" + addr + ", " + city + ", " + province + ", " + postal;
                dao.addAddress(email, address);
            }
            else
            {
                String address = addr + ", " + city + ", " + province + ", " + postal;
                dao.addAddress(email, address);
            }
            
            ArrayList<String> addresses = DAOFactory.createRole("visitor").getCustomerAddress(email);
            session.setAttribute("addresses", addresses);
            response.sendRedirect("profile.jsp");
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
        }
    }

    private void removeAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException 
    {
        try {
            DAO dao = DAOFactory.createRole("customer");
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String addr = request.getParameter("address");
            
            String checkAddress = dao.checkAddress(email);
            
            if (checkAddress.contains("|"))
            {
                String addr1 = checkAddress.substring(0,checkAddress.indexOf("|"));
                String addr2 = checkAddress.substring(checkAddress.indexOf("|") + 1, checkAddress.length());
                if (addr.equals(addr1))
                {
                    dao.removeAddress(email, addr1 + "|", addr2);
                }
                else if (addr.equals(addr2))
                {
                    dao.removeAddress(email, addr2 + "|", addr1);
                }
            }
            else
            {
                dao.removeAddress(email, "", addr);
            }
            
            ArrayList<String> addresses = DAOFactory.createRole("visitor").getCustomerAddress(email);
            session.setAttribute("addresses", addresses);
            response.sendRedirect("profile.jsp");
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
        }
    }
}
