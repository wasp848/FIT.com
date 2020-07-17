package Controller;

import Model.AgeInterpreter;
import Model.BirthdayToAgeExpression;
import Model.Expression;
import Model.Customer;
import Model.DAOFactory;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.DAO;
import static java.lang.ProcessBuilder.Redirect.to;

public class Register extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        DAO dao = DAOFactory.createRole("visitor");
        String message;
        
        String gender;
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("mail");
        Long num = Long.parseLong(request.getParameter("phone"));
        String radio = request.getParameter("gridRadios");
        if (radio.equals("option1"))
        {
            gender = "Male";
        }
        else {
            gender = "Female";
        }
        String pwd = request.getParameter("pwd");
        String cpwd = request.getParameter("cpwd");
        boolean hasUppercase = !pwd.equals(pwd.toLowerCase());
        boolean hasLowercase = !pwd.equals(pwd.toUpperCase());
        String dob = request.getParameter("dob");
        LocalDate brthld = LocalDate.parse(dob);
        Expression exp = new BirthdayToAgeExpression(dob);
        int age = exp.interpret(new AgeInterpreter());
        /*double h = Double.parseDouble(request.getParameter("height"));
        double hm = h/100;
        double w = Double.parseDouble(request.getParameter("weight"));
        double bmi = w/hm;
        request.setAttribute("bmi", bmi);*/
        message = passwordCondition(hasUppercase, hasLowercase, pwd, cpwd);

        try {
            String emailmsg = checkEmail(email);
            if (emailmsg!=null)
            {
                request.setAttribute("message", emailmsg);
                request.getRequestDispatcher("register.jsp").include(request, response);
            }
            else
            {
                if (message==null)
                {
                    //Customer theTrainee = new Customer(email, fname, lname, gender, cpwd, num, brthld, age, h, w, bmi);
                    Customer theTrainee = new Customer(email, fname, lname, gender, cpwd, num, brthld, age);
                    dao.registerCustomer(theTrainee);
                    
                    /*String sSubject = "SUCCESSFULLY REGISTERED!";
                    String sBody = "Welcome to FIT.com";
                    SendEmail.send(email,sSubject, sBody);*/
                    
                    request.setAttribute("registermessage", "Welcome to the FIT famiy. You may proceed to login.");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
                else
                {
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("register.jsp").include(request, response);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    
    //METHOD TO CHECK FOR PASSWORD REQUIREMENTS
    public String passwordCondition(boolean hasUppercase, boolean hasLowercase, String pwd, String cpwd)
    {
        String message;
        
        if (pwd.equals(cpwd))
        {
            if (pwd.length()<8)
            {
                message = "Password is required to be at least 8 characters long";
                return message;
            }
            else
            {
                if (!hasUppercase)
                {
                    message = "Password is required to have uppercase letter(s)";
                    return message;
                }
                else if (!hasLowercase)
                {
                    message = "Password is required to have lowercase letter(s)";
                    return message;
                }
                else if (!pwd.matches(".*\\d.*"))
                {
                    message = "Password is required to have one or more numbers";
                    return message;
                }
                else
                {
                    return null;
                }
            }
        }
        else
        {
            message = "Passwords do not match";
            return message;
        }
    }
    
    
    //METHOD TO CHECK FOR EMAIL AVAILABILITY
    public String checkEmail(String mail) throws SQLException
    {
        String message;
        DAO dao = DAOFactory.createRole("visitor");
        String email = dao.getEmailValidity(mail);
        if (email!=null)
        {
            message = "E-mail already exists";
            return message;
        }
        else
        {
            return null;
        }
    }
}
