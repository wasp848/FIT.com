/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Khalid Fazal
 */
public class DescendingSort implements SortStrategy
{
    private Connection connection;
    
    public DescendingSort()
    {
        connection=Database.getConnection();
    }
    
    @Override
    public ArrayList<Product> priceSort() throws SQLException 
    {
        ArrayList<Product> products = new ArrayList<Product>();
          
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product ORDER BY productPrice DESC");

         ResultSet rs = ps.executeQuery();
         while (rs.next())
         {
            int ID = rs.getInt("productID");
            String productImageDir = rs.getString("productImageDir");
            String productType = rs.getString("productType");
            String productBrand = rs.getString("productBrand");
            String productName = rs.getString("productName");
            String productDescription = rs.getString("productDescription");
            int productPrice = rs.getInt("productPrice");
            int numInStock = rs.getInt("numInStock");
            Product product = new Product(ID, productImageDir, productType, productBrand, productName, productDescription, productPrice, numInStock);
            products.add(product);
         }
         return products;
        /*ArrayList<Product> sortedProducts = new ArrayList<>();
        
        try {
            DAO dao = DAOFactory.createRole("customer");
            sortedProducts = dao.sortPriceDescProducts();
            return sortedProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;*/
    }

    @Override
    public ArrayList<Product> nameSort() throws SQLException 
    {
        ArrayList<Product> products = new ArrayList<Product>();
          
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product ORDER BY productName DESC");

         ResultSet rs = ps.executeQuery();
         while (rs.next())
         {
            int ID = rs.getInt("productID");
            String productImageDir = rs.getString("productImageDir");
            String productType = rs.getString("productType");
            String productBrand = rs.getString("productBrand");
            String productName = rs.getString("productName");
            String productDescription = rs.getString("productDescription");
            int productPrice = rs.getInt("productPrice");
            int numInStock = rs.getInt("numInStock");
            Product product = new Product(ID, productImageDir, productType, productBrand, productName, productDescription, productPrice, numInStock);
            products.add(product);
         }
         return products;
        /*ArrayList<Product> sortedProducts = new ArrayList<>();
        
        try {
            DAO dao = DAOFactory.createRole("customer");
            sortedProducts = dao.sortNameDescProducts();
            return sortedProducts;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;*/
    }
}
