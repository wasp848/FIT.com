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

public class VisitorDAO implements DAO
{
    private Connection connection;
    
    public VisitorDAO()
    {
        connection=Database.getConnection();
    }
    
    @Override
    public String authenticateUser (User theUser) throws SQLException
    {
        String email = theUser.getEmail();
        String password = theUser.getPassword();
        
        PreparedStatement ps = connection.prepareStatement("SELECT email,password,type FROM user");
        ResultSet rs = ps.executeQuery();
        
        while(rs.next())
        {
            String MAIL = rs.getString("email");
            String PWD = rs.getString("password");
            String TYPE = rs.getString("type");
            
            if (email.equalsIgnoreCase(MAIL) && password.equals(PWD) && TYPE.equals("Customer"))
            {
                return "Customer";
            }
            else if (email.equalsIgnoreCase(MAIL) && password.equals(PWD) && TYPE.equals("Trainer"))
            {
                return "Trainer";
            }
            else if (email.equalsIgnoreCase(MAIL) && password.equals(PWD) && TYPE.equals("Admin"))
            {
                return "Admin";
            }
        }
        return "Invalid";
    }
    
    @Override
    public String getCustomerName(String mail) throws SQLException
     {
         PreparedStatement ps = connection.prepareStatement("SELECT firstname,lastname FROM customer WHERE email=?");
         ps.setString(1, mail);
         ResultSet rs = ps.executeQuery();
         
         while (rs.next())
        {
            String fName = rs.getString("firstname");
            String sName = rs.getString("lastname");
            String name = fName + " " + sName;
                    
            return name;
        }
        return null;
     }

    @Override
    public String getAdminName(String mail) throws SQLException
     {
         PreparedStatement ps = connection.prepareStatement("SELECT firstname,lastname FROM admin WHERE email=?");
         ps.setString(1, mail);
         ResultSet rs = ps.executeQuery();
         
         while (rs.next())
        {
            String fName = rs.getString("firstname");
            String sName = rs.getString("lastname");
            String name = fName + " " + sName;
                    
            return name;
        }
        return null;
     }
     
    @Override
    public ArrayList<String> getCustomerAddress(String mail) throws SQLException
     {
         PreparedStatement ps = connection.prepareStatement("SELECT address FROM customer WHERE email=?");
         ps.setString(1, mail);
         ResultSet rs = ps.executeQuery();
         
         while (rs.next())
        {
            String address = rs.getString("address");
            
            if (address != null)
            {
                if (address.contains("|"))
                {
                    ArrayList<String> addresses = new ArrayList<>();
                    addresses.add(address.substring(0,address.indexOf("|")));
                    addresses.add(address.substring(address.indexOf("|")+1, address.length()));
                    return addresses;
                }
                else
                {
                    ArrayList<String> addresses = new ArrayList<>();
                    addresses.add(address);
                    return addresses;
                }
            }
            else
            {
                return new ArrayList<String>();
            }
        }
        return null;
     }

    @Override
    public long getCustomerContact(String mail) throws SQLException 
    {
        PreparedStatement ps = connection.prepareStatement("SELECT contactnumber FROM customer WHERE email=?");
         ps.setString(1, mail);
         ResultSet rs = ps.executeQuery();
         
         while (rs.next())
        {
            long number = rs.getLong("contactnumber");
                    
            return number;
        }
        return 0;
    }
     
    @Override
    public ArrayList<Card> getCustomerCard(String mail) throws SQLException
     {
         PreparedStatement ps = connection.prepareStatement("SELECT name,cardNumber,expiry,cvv FROM card WHERE email=?");
         ps.setString(1, mail);
         ResultSet rs = ps.executeQuery();
         
         ArrayList<Card> cards = new ArrayList<>();
         
         while (rs.next())
        {
           String name = rs.getString("name");
           long number = rs.getLong("cardNumber");
           String expiry = rs.getString("expiry");
           int cvv = rs.getInt("cvv");

           cards.add(new Card(name,number,expiry,cvv));
        }
        
        return cards;
     }
     
    @Override
    public void registerCustomer(Customer theCustomer)
    {
        PreparedStatement ps, ps1;
        try {
            /*ps = connection.prepareStatement("INSERT INTO customer(email, firstname, lastname, gender, contactnumber, password, dob, age, height, weight, bmi)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?)");*/
            ps = connection.prepareStatement("INSERT INTO customer(email, firstname, lastname, gender, contactnumber, password, dob, age)"
                    + " VALUES(?,?,?,?,?,?,?,?)");
            ps1 = connection.prepareStatement("INSERT INTO user(email, password, type)"
                    + " VALUES(?,?,?)");
            
            ps.setString(1, theCustomer.getEmail().toLowerCase());
            ps.setString(2, theCustomer.getFirstName());
            ps.setString(3, theCustomer.getLastName());
            ps.setString(4, theCustomer.getGender());
            ps.setLong(5, theCustomer.getContactNumber());
            ps.setString(6, theCustomer.getPassword());
            ps.setString(7, theCustomer.getDob().toString());
            ps.setInt(8, theCustomer.getAge());
            /*ps.setDouble(9, theCustomer.getHeight());
            ps.setDouble(10, theCustomer.getWeight());
            ps.setDouble(11, theCustomer.getBMI());*/
            
            ps1.setString(1, theCustomer.getEmail());
            ps1.setString(2, theCustomer.getPassword());
            ps1.setString(3, "Customer");
            
            ps.executeUpdate();
            ps1.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }      
    }
    
    @Override
    public String getEmailValidity(String mail) throws SQLException
    {
         PreparedStatement ps = connection.prepareStatement("SELECT password FROM user WHERE email=?");
         ps.setString(1, mail);
         ResultSet rs = ps.executeQuery();
         
         while (rs.next())
        {
            String pwd = rs.getString("password");
                    
            return pwd;
        }
        return null;
     }

    @Override
    public ResultSet getAllCustomers() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addMessage(Message message) {
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
    public ArrayList<Product> searchProduct(String keyword) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Product> getAllProducts() throws SQLException {
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
    public Product getProductFromID(int prodID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void checkout(Order order) throws SQLException {
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
