package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public interface DAO 
{
    public ResultSet getAllCustomers() throws SQLException;
    
    
    //METHOD TO AUTHENTICATE LOGIN
     public String authenticateUser (User theUser) throws SQLException;
     
     
     //METHOD TO GET THE NAME OF CURRENTLY LOGGED IN ADMIN
     public String getAdminName(String mail) throws SQLException;
     
     //METHOD TO GET THE NAME OF CURRENTLY LOGGED IN TRAINEE
     public String getCustomerName(String mail) throws SQLException;
     
    public long getCustomerContact(String mail) throws SQLException;
     
     public ArrayList<String> getCustomerAddress(String mail) throws SQLException;
     
     public ArrayList<Card> getCustomerCard(String mail) throws SQLException;
     
     
     //METHOD TO GET REGISTERED (TRAINEE) 
     public void registerCustomer(Customer theTrainee);
          
          
    //METHOD TO ADD A MESSAGE
    public void addMessage(Message message);

           
    //METHOD TO ADD A PRODUCT
    public void addProduct(Product product) throws SQLException;
    
    
    //METHOD TO REMOVE PRODUCT
    public void removeProduct(int ID);

    public ArrayList<Product> searchProduct(String keyword) throws SQLException ;

    public ArrayList<Product> getAllProducts() throws SQLException ;
    
    public ArrayList<Product> sortNameAscProducts() throws SQLException;
    
    public ArrayList<Product> sortNameDescProducts() throws SQLException;
    
    public ArrayList<Product> sortPriceAscProducts() throws SQLException;
    
    public ArrayList<Product> sortPriceDescProducts() throws SQLException;
    
    public ResultSet getAllCreatine() throws SQLException ;
    
    
    public ResultSet getAllWhey() throws SQLException ;
    
    
    public ResultSet getAllMass() throws SQLException ;
    
    
    public ResultSet getAllPre() throws SQLException ;
    
    
    public ResultSet getAllBCAA() throws SQLException ;
    
    
    public String getEmailValidity(String mail) throws SQLException;

    public Product getProductFromID(int prodID) throws SQLException ;

    public void checkout(Order order) throws SQLException ;

    public void updateInventory(ArrayList<Item> cart) throws SQLException;

    public List<Order> getAllOrders() throws SQLException;

    public void updateOrder(int ID, String status) throws SQLException;

    public void updateStock(int ID, int stock) throws SQLException;
    
    public void updateNumber(String email, long number) throws SQLException;
    
    public void addAddress(String email, String address) throws SQLException;
    
    public void removeAddress(String email, String addr, String address) throws SQLException;

    public String checkAddress(String email) throws SQLException;
    
    public void addCard(String email, Card card) throws SQLException ;
    
    public void removeCard(long cardNumber) throws SQLException;

    public String checkAddCard(String email, String number) throws SQLException ;
}