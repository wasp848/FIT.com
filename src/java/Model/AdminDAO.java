package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDAO implements DAO
{
    private Connection connection;
    
    public AdminDAO()
    {
        connection=Database.getConnection();
    }
    
    @Override
    public ResultSet getAllCustomers() throws SQLException
    {
         PreparedStatement ps = connection.prepareStatement("SELECT * FROM customer");

         ResultSet rs = ps.executeQuery();
         return rs;
    }
    
    @Override
    public void addProduct(Product product) throws SQLException
    {
        PreparedStatement ps;
        
        ps = connection.prepareStatement("INSERT INTO product(productID, productImageDir, productType, productBrand, productName, productDescription, productPrice, numInStock) VALUES(?,?,?,?,?,?,?,?)");

        ps.setInt(1, product.getProductID());
        ps.setString(2, product.getProductImageDir());
        ps.setString(3, product.getProductType());
        ps.setString(4, product.getProductBrand());
        ps.setString(5, product.getProductName());
        ps.setString(6, product.getProductDescription());
        ps.setInt(7, product.getProductPrice());
        ps.setInt(8, product.getNumInStock());

        ps.executeUpdate();    
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
    public void removeProduct(int ID)
    {
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement("DELETE FROM product WHERE productID=?");
            ps.setInt(1, ID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
    }
    
    @Override
    public void updateInventory(ArrayList<Item> cart) throws SQLException 
    {
        for (int i = 0;i<cart.size();i++)
        {
            int quantity = 0;
            PreparedStatement ps1 = connection.prepareStatement("SELECT numInStock from product WHERE productID=?");
            ps1.setInt(1, cart.get(i).getProduct().getProductID());
            ResultSet rs = ps1.executeQuery();
            
            while (rs.next())
            {
                quantity = rs.getInt("numInStock");
            }
            
            PreparedStatement ps = connection.prepareStatement("UPDATE product SET numInStock=? WHERE productID=?");
            ps.setInt(1, quantity - cart.get(i).getQuantity());
            ps.setInt(2, cart.get(i).getProduct().getProductID());
            ps.executeUpdate();
        }
    }

    @Override
    public List<Order> getAllOrders() throws SQLException 
    {
        ArrayList<Order> orders = new ArrayList<>();
        
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM orderdetails");
        ResultSet rs = ps.executeQuery();
        
        while (rs.next())
        {
            int ID = rs.getInt("orderID");
            String email = rs.getString("customerEmail");
            String items = rs.getString("items");
            int total = rs.getInt("total");
            String address = rs.getString("address");
            String pay = rs.getString("paymentMethod");
            long card = rs.getLong("cardNumber");
            String status = rs.getString("status");
            
            orders.add(new Order(ID, email, items, total, address, pay, card, status));
        }
        
        return orders;
    }

    @Override
    public void updateOrder(int ID, String status) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("UPDATE orderdetails SET status=? WHERE orderID=?");
        ps.setString(1, status);
        ps.setInt(2, ID);
        ps.executeUpdate();
    }

    @Override
    public void updateStock(int ID, int stock) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("UPDATE product SET numInStock=? WHERE productID=?");
        ps.setInt(1, stock);
        ps.setInt(2, ID);
        ps.executeUpdate();
    }

    @Override
    public String authenticateUser(User theUser) throws SQLException {
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
    public void addMessage(Message message) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ResultSet getAllCreatine() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ResultSet getAllWhey() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ResultSet getAllMass() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ResultSet getAllPre() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ResultSet getAllBCAA() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getEmailValidity(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Product getProductFromID(int prodID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void checkout(Order order) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateNumber(String email, long number) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addAddress(String email, String address) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeAddress(String email, String addr, String address) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String checkAddress(String email) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addCard(String email, Card card) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeCard(long cardNumber) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String checkAddCard(String email, String number) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getAdminName(String mail) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Product> sortNameAscProducts() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Product> sortNameDescProducts() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Product> sortPriceAscProducts() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Product> sortPriceDescProducts() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
