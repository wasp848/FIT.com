/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Card;
import Model.DAO;
import Model.DAOFactory;
import Model.Item;
import Model.Order;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.DAO;

public class CustomerCart extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try {
         String command = request.getParameter("command");
         if (command==null)
         {
             command="DISPC";
         }
         
         switch (command)
            {
                case "ADDC" : addToCart(request, response);break;
                case "REMOVEC" : removeFromCart(request, response);break;
                case "CHECKOUT" : checkout(request, response);break;
                default : displayCart(request, response);
            }
         } catch (Exception ex)     {
            ex.printStackTrace();
        }
    }

    
    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
    {
        DAO dao = DAOFactory.createRole("customer");
        HttpSession session = request.getSession();
        List<Item> cartt = (List<Item>) session.getAttribute("cart");
        String url = request.getParameter("url");
        String q = request.getParameter("numofitems");
        int qty = Integer.parseInt(q);
        String id = request.getParameter("prodID");
        int ID = Integer.parseInt(id);
        Product product = dao.getProductFromID(ID);
        
        if (cartt.isEmpty()) 
        {
            List<Item> cart = new ArrayList<Item>();
            cart.add(new Item(product, qty));
            session.setAttribute("cart", cart);
        } 
        else 
        {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExisting(ID, cart);
            if (index == -1) 
            {
                cartt.add(new Item(product, qty));
                session.setAttribute("cart", cartt);
            } 
            else 
            {
                int quantity = cart.get(index).getQuantity() + qty;
                cartt.get(index).setQuantity(quantity);
                session.setAttribute("cart", cartt);
            }
        }
        if (url.equals("shopall.jsp"))
        {
            response.sendRedirect("CustomerProduct");
        }
        else
        {
            response.sendRedirect(url);
        }
    }
    

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response)
    {
        try {
            String url = request.getParameter("url");
            HttpSession session = request.getSession();
            String id = request.getParameter("itemID");
            int ID = Integer.parseInt(id);
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExisting(ID, cart);
            cart.remove(index);
            session.setAttribute("cart", cart);
            if (url.equals("checkout.jsp"))
            {
                response.sendRedirect("checkout.jsp");
            }
            else if (url.equals("shopall.jsp"))
            {
                response.sendRedirect("CustomerProduct");
            }
            else
            {
                response.sendRedirect(url);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    
    private void displayCart(HttpServletRequest request, HttpServletResponse response) 
    {
        try {
            HttpSession session = request.getSession();
            request.getRequestDispatcher("checkout.jsp").include(request, response);
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }
    
    
    private int isExisting(int ID, List<Item> cart) 
    {
        for (int i = 0; i < cart.size(); i++) 
        {
            if (cart.get(i).getProduct().getProductID()==ID) {
                return i;
            }
        }
        return -1;
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response) 
    {
        try {
            DAO dao = DAOFactory.createRole("customer");
            HttpSession session = request.getSession();
            ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");
            ArrayList<String> orderCart = new ArrayList<>();
            int total = Integer.parseInt(request.getParameter("total"));
            String email = (String) session.getAttribute("email");
            
            String address,paymentMethod;
            long card = 0;
            String addressRadio = request.getParameter("address");
            String cardRadio = request.getParameter("card");
            
            if (addressRadio.equals("exaddress"))
            {
                address = request.getParameter("addr");
            }
            else
            {
                address = request.getParameter("addresss") + ", " + request.getParameter("city") + ", " + request.getParameter("province") + ", " + request.getParameter("postal");
            }
            
            if (cardRadio.equals("existingcard"))
            {
                paymentMethod = "Credit/Debit Card";
                card = Long.parseLong(request.getParameter("crd"));
            }
            else if (cardRadio.equals("newcard"))
            {
                paymentMethod = "Credit/Debit Card";
                card = Long.parseLong(request.getParameter("number"));
            }
            else
            {
                paymentMethod = "Cash on Delivery";
            }
            
            for (int i=0;i<cart.size();i++)
            {
                orderCart.add(String.valueOf(cart.get(i).getQuantity()) + "x " + cart.get(i).getProduct().getProductName());
            }
            
            Order order = new Order(email,orderCart,total,address,paymentMethod,card);
            dao.checkout(order);
            DAOFactory.createRole("admin").updateInventory(cart);
            cart.clear();
            session.setAttribute("cart", cart);
            response.sendRedirect("orderplaced.jsp");
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
        }
    }
}
