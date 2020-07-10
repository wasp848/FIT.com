/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAO;
import Model.DAOFactory;
import Model.Product;
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
public class AdminProduct extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
         String command = request.getParameter("command");
         if (command==null)
         {
             command="VIEWP";
         }
         
         switch (command)
            {
                case "SEARCHP" : adminSearchProducts(request, response);break;
                case "VIEWP" : adminDisplayAllProducts(request, response);break;
                case "ADDP" : adminAddProduct(request, response);break;
                case "REMOVEP" : adminRemoveProduct(request, response);break;
                case "UPDATEP" : adminUpdateProduct(request, response);break;
                default : adminDisplayAllProducts(request, response);
            }
         } catch (Exception ex)     {
            ex.printStackTrace();
        }
    }
    
    private void adminDisplayAllProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException 
    {
         DAO dao = DAOFactory.createRole("admin");
             
         List <Product> allProducts = dao.getAllProducts();
         request.setAttribute("products", allProducts);
         request.getRequestDispatcher("manageproducts.jsp").include(request, response);
    }
    
    private void adminSearchProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException 
    {
         DAO dao = DAOFactory.createRole("admin");
             
         String keyword = request.getParameter("ckeyword");
         List <Product> searchedProduct = dao.searchProduct(keyword);
         request.setAttribute("sproducts", searchedProduct);
         request.getRequestDispatcher("manageproducts.jsp").include(request, response);
    }

    private void adminRemoveProduct(HttpServletRequest request, HttpServletResponse response) 
    {
        try {
        DAO dao = DAOFactory.createRole("admin");
        String id = request.getParameter("prodID");
        
        dao.removeProduct(Integer.parseInt(id));    
        request.setAttribute("message", "Product successfully removed");
        request.getRequestDispatcher("AdminProduct").include(request, response);
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }

    private void adminAddProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
    {
    try {
        DAO dao = DAOFactory.createRole("admin");
        
        int ID = 0;
        String productImageDir = request.getParameter("productImageDir");
        String productType = request.getParameter("productType");
        String productBrand = request.getParameter("productBrand");
        String productName = request.getParameter("productName");
        String productDescription = "(" + request.getParameter("productDescription") + ")";
        String price = request.getParameter("productPrice");
        int productPrice = Integer.parseInt(price);
        String inStock = request.getParameter("numInStock");
        int numInStock = Integer.parseInt(inStock);
        
        Product product = new Product(ID, productImageDir, productType, productBrand, productName, productDescription, productPrice, numInStock);
        dao.addProduct(product);
        adminDisplayAllProducts(request, response);
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    }

    private void adminUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try {
        DAO dao = DAOFactory.createRole("admin");
        int ID = Integer.parseInt(request.getParameter("prodID"));
        int stock = Integer.parseInt(request.getParameter("updateStock"));
        
        dao.updateStock(ID, stock);
        adminDisplayAllProducts(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
