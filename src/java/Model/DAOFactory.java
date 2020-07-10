package Model;

public class DAOFactory 
{
    public static DAO visitor = new VisitorDAO();
    public static DAO customer = new CustomerDAO();
    public static DAO admin = new AdminDAO();
    
    public static DAO createRole(String role)
    {
        switch(role)
        {
            case "visitor": return visitor;
            
            case "customer": return customer;
            
            case "admin": return admin;
        }
        
        return null;
    }
}