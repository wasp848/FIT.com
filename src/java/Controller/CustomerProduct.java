/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.AscendingSort;
import Model.DAO;
import Model.DAOFactory;
import Model.Product;
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
import Model.DAO;
import Model.DescendingSort;
import Model.SortStrategy;

/**
 *
 * @author Khalid Fazal
 */
public class CustomerProduct extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try 
        {
         String command = request.getParameter("command");
         if (command==null)
         {
             command="GETP";
         }
         
         switch (command)
            {
                case "GETP" : getAllProducts(request, response);break;
                case "SORTP" : sortProduct(request, response);break;
                case "SEARCHP" : searchProducts(request, response);break;
                default : getAllProducts(request, response);
            }
         } catch (Exception ex)     
         {
            ex.printStackTrace();
         }
    }

    private void getAllProducts(HttpServletRequest request, HttpServletResponse response) 
    {
        try {
            DAO dao = DAOFactory.createRole("customer");
            ArrayList<Product> allProducts = dao.getAllProducts();
            
            request.setAttribute("sortmode", "Default Sorting");
            request.setAttribute("products", allProducts);
            request.getRequestDispatcher("shopall.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response) 
    {
        try {
            DAO dao = DAOFactory.createRole("customer");
            String keyword = request.getParameter("ckeyword");
            
            ArrayList<Product> sProducts = dao.searchProduct(keyword);

            request.setAttribute("sproducts", sProducts);
            request.getRequestDispatcher("shopall.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }

    private void sortProduct(HttpServletRequest request, HttpServletResponse response) 
    {
        String sort = request.getParameter("sort");
        
        switch (sort)
        {
            case "1":getAllProducts(request, response);break;
            
            case "2":sortNameAsc(request, response);break;
            
            case "3":sortNameDesc(request, response);break;
            
            case "4":sortPriceAsc(request, response);break;
            
            case "5":sortPriceDesc(request, response);break;
        }
    }
    
    private void sortNameAsc(HttpServletRequest request, HttpServletResponse response)
    {
        try {
            SortStrategy ascSort = new AscendingSort();
            ArrayList<Product> sortedProducts = ascSort.nameSort();
            
            request.setAttribute("sortmode", "Name (Ascending)");
            request.setAttribute("sortproducts", sortedProducts);
            request.getRequestDispatcher("shopall.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }
    
    private void sortNameDesc(HttpServletRequest request, HttpServletResponse response)
    {
        try {
            SortStrategy descSort = new DescendingSort();
            ArrayList<Product> sortedProducts = descSort.nameSort();
            
            request.setAttribute("sortmode", "Name (Descending)");
            request.setAttribute("sortproducts", sortedProducts);
            request.getRequestDispatcher("shopall.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }
    
    private void sortPriceAsc(HttpServletRequest request, HttpServletResponse response)
    {
        try {
            SortStrategy ascSort = new AscendingSort();
            ArrayList<Product> sortedProducts = ascSort.priceSort();
            
            request.setAttribute("sortmode", "Price (Ascending)");
            request.setAttribute("sortproducts", sortedProducts);
            request.getRequestDispatcher("shopall.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }
    
    private void sortPriceDesc(HttpServletRequest request, HttpServletResponse response)
    {
        try {
            SortStrategy descSort = new DescendingSort();
            ArrayList<Product> sortedProducts = descSort.priceSort();
            
            request.setAttribute("sortmode", "Price (Descending)");
            request.setAttribute("sortproducts", sortedProducts);
            request.getRequestDispatcher("shopall.jsp").forward(request, response);
        } catch (SQLException | ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }
}
