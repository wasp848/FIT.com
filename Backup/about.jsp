<%-- 
    Document   : Login
    Created on : Mar 22, 2020, 1:10:45 PM
    Author     : Khalid Fazal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FIT.com - About Us</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
         <nav class="navbar navbar-dark bg-dark custoomnav">
             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
             
             <div>
                <table class="navbar-nav mr-auto navnormal">
                    <tr>
                        <td class="nav-item">
                            <a class="nav-link custoomnavitem" href="index.jsp">Home</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="routines.jsp">Routines</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="CustomerProduct">Shop</a>
                        </td>
                        <td class="nav-item active">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="contact.jsp">Contact Us</a>
                        </td>
                    </tr>
                </table>
                 
                 <table class="navacccrt">
                     <tr>
                        <td>
                            <div class="headeraccount">
                               <c:if test="${empty email}">
                                   <a href="login.jsp"><button style="margin-right: 10px;" class="btn btn-outline-success my-2 my-sm-0 navloginbtn">Login</button></a>
                               </c:if>
                                <c:if test="${not empty email}">
                                  <a id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                     <img class="headerbtn" src="Assets/Images/account.png" height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  </a>
                                  <div class="dropdown-menu loggedindmenu" aria-labelledby="dLabel">
                                      <button class="viewprof"><a href="profile.jsp">Go to Profile</a></button>
                                      <div class="dropdown-divider"></div>
                                      <button class="dropdown-item logsignup"><a href="Logout">Logout</a></button>   
                                  </div>
                               </c:if>
                           </div>
                        </td>
                        
                        <td>
                            <div class="headercart">
                                <c:if test="${empty email}">
                                   <a href="register.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Sign Up</button></a>
                                </c:if>
                                 <c:if test="${not empty email}">
                                     <c:if test="${not empty cart}">
                                           <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                             <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          </a>
                                          <div class="dropdown-menu cartdmenu" aria-labelledby="emptycartd">
                                              <c:set var="total" value="0"></c:set>
                                              <c:set var="totalqty" value="0"></c:set>
                                               <c:forEach var="item" items="${sessionScope.cart}">
                                                   <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                                                   <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                                                   <form class="checkoutcartform" method="GET" action="CustomerCart">
                                                       <input name="itemID" type="hidden" value="${item.getProduct().getProductID()}">
                                                       <input name="command" type="hidden" value="REMOVEC">
                                                       <input name="url" type="hidden" value="index.jsp">
                                                       <table class="eachitemtable">
                                                           <tr>
                                                               <td>
                                                                   ${item.getProduct().getProductName()}
                                                                   <button type="submit" class="btn nav-link removeitembtn">X</button>
                                                                   <p class="itemqty">Quantity: ${item.getQuantity()}</p>
                                                               </td>
                                                               <td>
                                                                   <p class="itemprice">${item.getProduct().getProductPrice() * item.getQuantity()}</p>
                                                               </td>
                                                           </tr>
                                                       </table>
                                                   </form>
                                               </c:forEach><br>
                                               <p class="carttotal">Total: ${total}</p>
                                              <a href="checkout.jsp" class="checkoutcartbtn">Checkout</a>
                                          </div>
                                          <label class="cartqty">${totalqty}</label>
                                     </c:if>
                                     <c:if test="${empty cart}">
                                         <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                           <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </a>
                                        <div class="dropdown-menu emptycartdmenu" aria-labelledby="emptycartd">
                                            <p>&nbsp;&nbsp;&nbsp;Cart is empty</p>
                                            <button disabled type="submit" class="discheckoutcartbtn">Checkout</button>
                                        </div>
                                      <label class="cartqty">0</label>
                                     </c:if>
                                </c:if>
                            </div>
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
                         <td>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                         </td>
                     </tr>
                 </table>
                 <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="routines.jsp">Routines</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="CustomerProduct">Shop</a>
                        </li>
                        <li class="nav-item active">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="contact.jsp">Contact Us</a>
                        </li>
                    </ul>
                 </div>
            </nav>
        </c:if>
        
        <c:if test="${not empty sessionScope.email}">
            <table>
                <tr>
                    <td>
                         <a id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="headerbtn" src="Assets/Images/account.png" height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         </a>
                         <div class="dropdown-menu loggedindmenu" aria-labelledby="dLabel">
                             <button class="viewprof"><a href="profile.jsp">Go to Profile</a></button>
                             <div class="dropdown-divider"></div>
                             <button class="dropdown-item logsignup"><a href="Logout">Logout</a></button>   
                         </div>
                    </td>
                    <td>
                        <c:if test="${not empty cart}">
                            <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           </a>
                           <div class="dropdown-menu cartdmenu" aria-labelledby="emptycartd">
                               <c:set var="total" value="0"></c:set>
                               <c:set var="totalqty" value="0"></c:set>
                                <c:forEach var="item" items="${sessionScope.cart}">
                                    <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                                    <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                                    <form class="checkoutcartform" method="GET" action="CustomerCart">
                                        <input name="itemID" type="hidden" value="${item.getProduct().getProductID()}">
                                        <input name="command" type="hidden" value="REMOVEC">
                                        <input name="url" type="hidden" value="shopall.jsp">
                                        <table class="eachitemtable">
                                            <tr>
                                                <td>
                                                    ${item.getProduct().getProductName()}
                                                    <button type="submit" class="btn nav-link removeitembtn">X</button>
                                                    <p class="itemqty">Quantity: ${item.getQuantity()}</p>
                                                </td>
                                                <td>
                                                    <p class="itemprice">${item.getProduct().getProductPrice() * item.getQuantity()}</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </c:forEach><br>
                                <p class="carttotal">Total: ${total}</p>
                               <a href="checkout.jsp" class="checkoutcartbtn">Checkout</a>
                           </div>
                           <label class="cartqty">${totalqty}</label>
                        </c:if>
                        <c:if test="${empty cart}">
                          <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         </a>
                         <div class="dropdown-menu emptycartdmenu" aria-labelledby="emptycartd">
                             <p>&nbsp;&nbsp;&nbsp;Cart is empty</p>
                             <button disabled type="submit" class="discheckoutcartbtn">Checkout</button>
                         </div>
                         <label class="cartqty">0</label>
                      </c:if>
                    </td>
                    <td>
                        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mobilenav">
                             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
                             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.jsp">Home</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="routines.jsp">Routines</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="CustomerProduct">Shop</a>
                                    </li>
                                    <li class="nav-item active">
                                      <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="contact.jsp">Contact Us</a>
                                    </li>
                                </ul>
                             </div>
                        </nav>
                    </td>
                </tr>
            </table>
        </c:if>
        
        <div class="aboutmid">
            <div class="part1bg"></div>
            <div class="part1">
                <p class="whoweare">
                    WE BELIEVE EVERYBODY IS AN ATHLETE.<br>
                    WE BELIEVE IN GETTING RID OF EXCUSES.<br>
                    WE BELIEVE IN LIFELONG FITNESS.<br>
                    WE BELIEVE FITNESS CHANGES LIVES.<br>
                    <p class="wearefit">WE ARE FIT™</p>
                </p>
            </div>
            
            <div class="part2bg"></div>
            <div class="part2">
                <p class="quote">WHAT A DISGRACE IT IS FOR A MAN<BR>TO GROW OLD WITHOUT EVER SEEING<BR>THE BEAUTY AND STRENGTH OF<BR>WHICH HIS BODY IS CAPABLE</p><p class="socrates"> - SOCRATES</p>
            </div>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>
