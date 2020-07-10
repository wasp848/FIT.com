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

public class CustomerDAO implements DAO
{
    private Connection connection;
    
    public CustomerDAO()
    {
        connection=Database.getConnection();
    }
    
    @Override
    public void addMessage(Message message)
    {
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement("INSERT INTO message(email, fullname, message) VALUES(?,?,?)");
            
            ps.setString(1, message.getEmail());
            ps.setString(2, message.getFullname());
            ps.setString(3, message.getMessage());
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }      
    }
    
    @Override
    public ArrayList<Product> getAllProducts() throws SQLException 
    {
         ArrayList<Product> products = new ArrayList<Product>();
          
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product");

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
    }
    
    @Override
    public ArrayList<Product> searchProduct(String keyword) throws SQLException 
    {
         ArrayList<Product> products = new ArrayList<Product>();
          
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product WHERE productName LIKE '%"+keyword+"%'");

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
    }
    
    @Override
    public ArrayList<Product> sortNameAscProducts() throws SQLException 
    {
         ArrayList<Product> products = new ArrayList<Product>();
          
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product ORDER BY productName ASC");

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
    }
    
    @Override
    public ArrayList<Product> sortNameDescProducts() throws SQLException 
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
    }
    
    @Override
    public ArrayList<Product> sortPriceAscProducts() throws SQLException 
    {
         ArrayList<Product> products = new ArrayList<Product>();
          
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product ORDER BY productPrice ASC");

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
    }
    
    @Override
    public ArrayList<Product> sortPriceDescProducts() throws SQLException 
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
    }
    
    @Override
    public ResultSet getAllCreatine() throws SQLException 
    {
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product where productType=?");
         ps.setString(1, "Creatine");

         ResultSet rs = ps.executeQuery();
         return rs;
    }
    
    @Override
    public ResultSet getAllWhey() throws SQLException 
    {
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product where productType=?");
         ps.setString(1, "Whey Protein");

         ResultSet rs = ps.executeQuery();
         return rs;
    }
    
    @Override
    public ResultSet getAllMass() throws SQLException 
    {
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product where productType=?");
         ps.setString(1, "Mass Gainer");

         ResultSet rs = ps.executeQuery();
         return rs;
    }
    
    @Override
    public ResultSet getAllPre() throws SQLException 
    {
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product where productType=?");
         ps.setString(1, "Pre Workout");

         ResultSet rs = ps.executeQuery();
         return rs;
    }
    
    @Override
    public ResultSet getAllBCAA() throws SQLException 
    {
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM product where productType=?");
         ps.setString(1, "BCAA");

         ResultSet rs = ps.executeQuery();
         return rs;
    }
    
    @Override
    public Product getProductFromID(int prodID) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM product WHERE productID=?");
        ps.setInt(1, prodID);
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
            return product;
        }
        return null;
    }
    
    @Override
    public void checkout(Order order) throws SQLException 
    {
        if (order.getCard()!=0)
        {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO orderdetails(orderID,customerEmail,items,total,address,paymentMethod,cardNumber,status) "
                    + "VALUES(?,?,?,?,?,?,?,?)");
            ps.setInt(1, 0);
            ps.setString(2,order.getEmail());
            ps.setString(3,order.getItems().toString());
            ps.setInt(4, order.getTotal());
            ps.setString(5,order.getAddress());
            ps.setString(6,order.getPaymentMethod());
            ps.setLong(7,order.getCard());
            ps.setString(8, "In Progress");
            ps.executeUpdate(); 
        }
        else
        {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO orderdetails(orderID,customerEmail,items,total,address,paymentMethod,status) "
                    + "VALUES(?,?,?,?,?,?,?)");
            ps.setInt(1, 0);
            ps.setString(2,order.getEmail());
            ps.setString(3,order.getItems().toString());
            ps.setInt(4, order.getTotal());
            ps.setString(5,order.getAddress());
            ps.setString(6,order.getPaymentMethod());
            ps.setString(7, "In Progress");
            ps.executeUpdate();
        }
    }
    
    @Override
    public void updateNumber(String email, long number) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("UPDATE customer SET contactnumber=? WHERE email=?");
        ps.setLong(1, number);
        ps.setString(2, email);
        ps.executeUpdate();
    }
    
    @Override
    public void addAddress(String email, String address) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("UPDATE customer SET address=? WHERE email=?");
        ps.setString(1, address);
        ps.setString(2, email);
        ps.executeUpdate();
    }
    
    @Override
    public void removeAddress(String email, String addr, String address) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("UPDATE customer SET address=? WHERE email=?");
        if (addr.contains("|"))
        {
            ps.setString(1, address);
            ps.setString(2, email);
            ps.executeUpdate();
        }
        else
        {
            ps.setString(1, null);
            ps.setString(2, email);
            ps.executeUpdate();
        }
    }

    @Override
    public String checkAddress(String email) throws SQLException 
    {
         PreparedStatement ps = connection.prepareStatement("SELECT address FROM customer WHERE email=?");
         ps.setString(1, email);
         ResultSet rs = ps.executeQuery();
         
         while (rs.next())
        {
            String address = rs.getString("address");
                    
            return address;
        }
        return null;
    }
    
    @Override
    public void addCard(String email, Card card) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("INSERT INTO card (email,name,cardNumber,expiry,cvv) VALUES (?,?,?,?,?)");
        ps.setString(1, email);
        ps.setString(2, card.getName());
        ps.setLong(3, card.getCardNumber());
        ps.setString(4, card.getExpiry());
        ps.setInt(5, card.getCvv());
        ps.executeUpdate();
    }
    
    @Override
    public void removeCard(long cardNumber) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("DELETE FROM card WHERE cardNumber=?");
        ps.setLong(1, cardNumber);
        ps.executeUpdate();
    }

    @Override
    public String checkAddCard(String email, String number) throws SQLException 
    {
         PreparedStatement ps = connection.prepareStatement("SELECT cardNumber FROM card WHERE email=?");
         ps.setString(1, email);
         ResultSet rs = ps.executeQuery();
         
         ArrayList<String> cards = new ArrayList<>();
         
         while (rs.next())
        {
            String card = rs.getString("cardnumber");
            cards.add(card);
        }
         
        if (cards.size()>1)
        {
           return "Max"; 
        }
        else if (cards.size()==1)
        {
            if (cards.get(0).equals(number))
            {
                return "Available";
            }
            else
            {
                return "Continue";
            }
        }
        else
        {
            return "Continue";
        }
    }

    @Override
    public ResultSet getAllCustomers() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String authenticateUser(User theUser) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getAdminName(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getCustomerName(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public long getCustomerContact(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<String> getCustomerAddress(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Card> getCustomerCard(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void registerCustomer(Customer theTrainee) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addProduct(Product product) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeProduct(int ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getEmailValidity(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateInventory(ArrayList<Item> cart) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Order> getAllOrders() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateOrder(int ID, String status) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateStock(int ID, int stock) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
