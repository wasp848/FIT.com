<%-- 
    Document   : register
    Created on : May 6, 2020, 11:38:22 PM
    Author     : Khalid Fazal
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FIT.com - Register</title>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
    </head>
    <body>
         <nav class="navbar navbar-dark bg-dark custoomnav">
             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
             
             <div>
                 <table style="right: 2%;" class="navbar-nav mr-auto navnormal">
                    <tr>
                        <td>
                            <a href="login.jsp"><button style="margin-right: 10px;" class="btn btn-outline-success my-2 my-sm-0 navloginbtn">Login</button></a>
                        </td>
                        <td>
                             <a href="register.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Sign Up</button></a>
                        </td>
                    </tr>
                </table>
             </div>
        </nav>
        
        <c:if test="${empty sessionScope.email}">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mobilenav">
                 <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
                 <table class="navtable">
                     <tr>
                         <td>
                            <a href="login.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navloginbtn">Login</button></a>
                         </td>
                         <td>
                            <a href="register.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Sign Up</button></a>
                         </td>
                     </tr>
                 </table>
            </nav>
        </c:if>
        
        <div class="registermid">
             <div class="registerbgform pcregform">
                <label class="errorlbl">${requestScope.message}</label><br>
                <form id="registertraineeform" class="registerform" action="Register" method="GET">
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>
                                <label class="registerformlbl" for="exampleInputEmail1">First Name<abbr title="Required">*</label>
                                <input type="text" name="fname" class="form-control2" id="formfname" aria-describedby="emailHelp" pattern="^[A-Za-z ,.'-]+$" required>
                            </td>
                            <td>
                                <label style="margin-left: 17px;" class="registerformlbl" for="exampleInputEmail1">Last Name<abbr title="Required">*</label>
                                <input type="text" name="lname" class="form-control2 inp2" id="formlname" aria-describedby="emailHelp" pattern="^[A-Za-z ,.'-]+$" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl rflemail" for="exampleInputEmail1">Email address<abbr title="Required">*</label><br>
                            </td>
                            <td>
                                <br><input type="email" name="mail" class="form-control2 inp2" id="formemail" aria-describedby="emailHelp" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl" for="exampleInputEmail1">Contact number<abbr title="Required">*</label>
                                <input type="text" name="phone" class="form-control2" id="formphone" aria-describedby="emailHelp" placeholder="94767682073" minlength="11" maxlength="11" pattern="^[0-9]*$" required>
                            </td>
                            <td>
                                <fieldset class="form-group" name="gender">
                                    <br><label style="margin-left: 17px;" class="registerformlbl" for="exampleInputEmail1">Gender:<abbr title="Required">*</label>
                                        <div class="col-sm-10 gendercheck">
                                          <div class="form-check">
                                            <label class="form-check-label registerformlbl genderlbl" for="gridRadios1">
                                              <input class="form-check-input" type="radio" name="gridRadios" id="formmale" value="option1" checked required>
                                              Male
                                            </label>
                                              <label style="margin-left: 40px;" class="form-check-label registerformlbl genderlbl" for="gridRadios2">
                                              <input class="form-check-input" type="radio" name="gridRadios" id="formfemale" value="option2">
                                              Female
                                            </label>
                                          </div>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl" for="exampleInputEmail1">Password<abbr title="Required">*</label>
                                <input type="password" name="pwd" class="form-control2" id="formpwd" aria-describedby="emailHelp" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                            </td>
                            <td>
                                <br><label style="margin-left: 17px;" class="registerformlbl" for="exampleInputEmail1">Confirm Password<abbr title="Required">*</label>
                                <input type="password" name="cpwd" class="form-control2 inp2" id="formcpwd" aria-describedby="emailHelp" required>
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <br><label class="registerformlbl rfldob" for="exampleInputEmail1">Date of Birth<abbr title="Required">*</label>
                            </td>
                            <td>
                                <br><input type="date" name="dob" class="form-control3 fc3dob" id="formdob" aria-describedby="emailHelp" required>
                            </td>
                        </tr>
                    </table>
                            
                    <div class="submit-legalese">
                        <br><p class="passwordtip">Password is required to have at least 8 characters and contain lowercase letters, uppercase letters and numbers</p>
                        By clicking "Sign Up" you agree and consent to the FIT.com <a href="#">Terms of Use and Privacy Policy</a>
                    </div>
                            
                    <br><button type="submit" class="btn registerbtn">Sign Up</button>
                </form>
             </div>
                            
             <div class="registerbgform mobileregform">
                <form id="registertraineeform" class="registerform" action="Register" method="GET">
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>
                                <label class="registerformlbl" for="exampleInputEmail1">First Name</label>
                                <input type="text" name="fname" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="^[A-Za-z ,.'-]+$" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl" for="exampleInputEmail1">Last Name</label>
                                <input type="text" name="lname" class="form-control2 inp2" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="^[A-Za-z ,.'-]+$" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl" for="exampleInputEmail1">Email address</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="email" name="mail" class="form-control2 inp2" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl" for="exampleInputEmail1">Contact number</label>
                                <input type="text" name="phone" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="94767682073" maxlength="11" pattern="^[0-9]*$" required> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset class="form-group" name="gender">
                                    <br><label class="registerformlbl" for="exampleInputEmail1">Gender: </label>
                                        <div class="col-sm-10 gendercheck">
                                          <div class="form-check">
                                            <label style="margin-bottom: 5px;" class="form-check-label registerformlbl genderlbl" for="gridRadios1">
                                              <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked required>
                                              Male
                                            </label>
                                              <label class="form-check-label registerformlbl genderlbl" for="gridRadios2">
                                              <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                                              Female
                                            </label>
                                          </div>
                                        </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl" for="exampleInputEmail1">Password</label>
                                <input type="password" name="pwd" class="form-control2" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <label class="registerformlbl" for="exampleInputEmail1">Confirm Password</label>
                                <input type="password" name="cpwd" class="form-control2 inp2" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                <label class="text-muted" value=""></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br><label class="registerformlbl" for="exampleInputEmail1">Date of Birth</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="date" name="dob" class="form-control3 fc3dob" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            </td>
                        </tr>
                    </table>
                            
                    <div class="submit-legalese">
                        <br><p class="passwordtip">Password is required to have at least 8 characters and contain lowercase letters, uppercase letters and numbers</p>
                        By clicking "Sign Up" you agree and consent to the FIT.com <a href="#">Terms of Use and Privacy Policy</a>
                    </div>
                            
                    <br><label style="padding: 0 20px 0 20px;" class="mobileerrorlbl">${requestScope.message}</label><br>
                    <br><button type="submit" class="btn registerbtn">Sign Up</button>
                </form>
             </div>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>
