<%-- 
    Document   : profile
    Created on : Jun 11, 2020, 10:17:06 AM
    Author     : Khalid Fazal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FIT.com - My Profile</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/mdb.js"></script>
        <link rel="stylesheet" href="Styling/mdb.css">
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png"/>
        <script>
            function openCartNav() {
              document.getElementById("myCartSidenav").style.width = "300px";
            }

            function closeCartNav() {
              document.getElementById("myCartSidenav").style.width = "0";
            }
        </script>
    </head>
    <body>
        <div style="background-color: #333333;text-align: center;">
            <c:if test="${empty requestScope.registermessage}">
                <label style="color: #ff0b0b;font-weight: bold;">${requestScope.loginmessage}</label>
            </c:if>
            <c:if test="${not empty requestScope.registermessage}">
                <label style="color: #ff0b0b;font-weight: bold;">${requestScope.registermessage}</label>
            </c:if>
        </div>
        
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
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="contact.jsp">Contact Us</a>
                        </td>
                        <c:if test="${not empty email}">
                            <td class="nav-item active">
                                <a class="nav-link custoomnavitem" href="profile.jsp">My Profile</a>
                            </td>
                        </c:if>
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
                                     <c:if test="${not empty cart}">
                                          <c:set var="total" value="0"></c:set>
                                          <c:set var="totalqty" value="0"></c:set>
                                          <c:forEach var="item" items="${sessionScope.cart}">
                                            <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                                            <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                                          </c:forEach>
                                           <a id="cartd" onclick="openCartNav()" aria-haspopup="true" aria-expanded="false">
                                             <img class="headerbtn" src="Assets/Images/cart.png" height="35">
                                             <label class="cartqty">${totalqty}</label>
                                          </a>
                                     </c:if>
                                     <c:if test="${empty cart}">
                                         <a id="cartd" onclick="openCartNav()" aria-haspopup="true" aria-expanded="false">
                                           <img class="headerbtn" src="Assets/Images/cart.png" height="35">
                                           <label class="cartqty">0</label>
                                        </a>
                                     </c:if>
                                </c:if>
                           </div>
                        </td>
                        
                        <td>
                            <div class="headercart">
                                <c:if test="${empty email}">
                                   <a href="register.jsp"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Sign Up</button></a>
                                </c:if>
                                <c:if test="${not empty email}">
                                  <a href="Logout"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Logout</button></a>
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
                        <li class="nav-item">
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
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mobilenav">
                 <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
                 <table class="navtable">
                     <tr>
                         <td>
                            <c:set var="total" value="0"></c:set>
                            <c:set var="totalqty" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.cart}">
                              <c:set var="total" value="${total + item.getProduct().getProductPrice() * item.getQuantity()}"></c:set>
                              <c:set var="totalqty" value="${totalqty + item.getQuantity()}"></c:set>
                            </c:forEach>
                            <a id="cartd" onclick="openCartNav()" aria-haspopup="true" aria-expanded="false">
                               <img class="headerbtn" src="Assets/Images/cart.png" height="27">
                               <label class="cartqtymobile">${totalqty}</label>
                            </a>
                         </td>
                         <td>
                            <a href="Logout"><button class="btn btn-outline-success my-2 my-sm-0 navregisterbtn">Logout</button></a>
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
                        <li class="nav-item">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="contact.jsp">Contact Us</a>
                        </li>
                        <li class="nav-item active">
                          <a class="nav-link" href="profile.jsp">My Profile</a>
                        </li>
                    </ul>
                 </div>
            </nav>
        </c:if>
        
        <div style="padding: 10px;background-color: white;min-height: 475px;color: black;position: relative;">
            <div id="myCartSidenav" class="sidenav notshopnav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeCartNav()">&times;</a>
                <c:if test="${not empty cart}">
                    <a href="checkout.jsp" class="checkoutcartbtn">Checkout</a>
                    <br><p style="color: white;font-size: 20px;text-align: center;">Your Cart</p>
                    <p class="carttotal">Total: ${total}</p>
                    <div class="cartitems">
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
                                            <p class="itemname">${item.getProduct().getProductName()}</p>
                                            <p class="itemqty">Quantity: ${item.getQuantity()}</p>
                                        </td>
                                        <td>
                                            <button type="submit" class="btn nav-link removeitembtn">X</button>
                                            <p class="itemprice">${item.getProduct().getProductPrice() * item.getQuantity()}</p>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </c:forEach><br>
                    </div>
             </c:if>
             <c:if test="${empty cart}">
                 <br><p style="margin-left: 30px;color: white;">Cart is empty</p>
             </c:if>
            </div>
        
                <div class="myaccountdiv">
                    <div class="personalinfodiv">
                        <label class="profilehead"><img style="margin-bottom: 5px;" height="55" src="Assets/Images/personaldetails.png">&nbsp;Personal Information</label>
                        <p class="nametxt">Full Name: ${sessionScope.fullname}</p>
                        <p class="emailtxt">Email Address: ${sessionScope.email}</p>
                        <p class="numtxt">Contact Number: ${sessionScope.contact}&nbsp;&nbsp;
                        <a data-toggle="modal" data-target="#updateContactModal"><img class="editnumbtnimg" src="Assets/Images/edit1.png" height="14px"></a></p>
                    </div> 
                        
                    <c:if test = "${sessionScope.addresses.size() != 0}">
                        <div class="adressesdiv">
                            <label class="profilehead"><img style="margin-bottom: 5px;" height="55" src="Assets/Images/addressbook.png">&nbsp;Address Book</label>
                            <c:if test = "${sessionScope.addresses.size() > 1}">
                                <c:set var="index1" value="${0}"></c:set>
                                <c:forEach var="addresses" items="${sessionScope.addresses}">
                                    <form class="addresstxt" action="CustomerAddress" method="GET">
                                        <input name="command" type="hidden" value="REMOVEA">
                                        <input name="address" type="hidden" value="${sessionScope.addresses[index1]}">
                                        <button class="removeaddressbtn" type="submit"><img class="removeaddressbtnimg" src="Assets/Images/remove_1.png"></button>
                                        <label style="color: black;font-weight: 600;">Address ${index1 + 1}: </label>${sessionScope.addresses[index1]}
                                    </form>
                                    <c:set var="index1" value="${0 + 1}"></c:set>
                                </c:forEach>
                                <label class="mutedlbl">You have added the max number of addresses. Please remove one to add another.</label>
                            </c:if>
                            <c:if test = "${sessionScope.addresses.size() == 1}">
                                <form action="CustomerAddress" method="GET">
                                    <input name="command" type="hidden" value="REMOVEA">
                                    <input name="address" type="hidden" value="${sessionScope.addresses[0]}">
                                    <button class="removeaddressbtn" type="submit"><img class="removeaddressbtnimg" src="Assets/Images/remove_1.png"></button>
                                    <label style="color: black;font-weight: 600;">Address 1: </label>${sessionScope.addresses[0]}
                                </form>
                                <a class="addtomyaccount" data-toggle="modal" data-target="#addAddressModal">&nbsp;&nbsp;<img class="removeaddressbtnimg" src="Assets/Images/add_1.png" height="18px">&nbsp;&nbsp;Add another address</a>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test = "${sessionScope.addresses.size() == 0}">
                        <div class="adressesdiv">
                            <label class="profilehead"><img style="margin-bottom: 5px;" height="55" src="Assets/Images/addressbook.png">Address Book</label>
                            <p class="naddresstxt">You haven't saved any addresses yet</p>
                            <a class="addtomyaccount" data-toggle="modal" data-target="#addAddressModal">&nbsp;&nbsp;<img class="removeaddressbtnimg" src="Assets/Images/add_1.png" height="14px">&nbsp;&nbsp;Add an address</a>
                        </div>
                    </c:if>
                                
                    <c:if test = "${sessionScope.cards.size() != 0}">
                        <div class="paymentinfodiv">
                            <label class="profilehead"><img style="margin-bottom: 5px;" height="55" src="Assets/Images/cards.png">&nbsp;Payment Information</label>
                            <c:if test = "${sessionScope.cards.size() > 1}">
                                <c:set var="index" value="${0}"></c:set>
                                <c:forEach var="cards" items="${sessionScope.cards}">
                                    <form action="CustomerCard" method="GET">
                                        <input name="command" type="hidden" value="REMOVEC">
                                        <input name="card" type="hidden" value="${sessionScope.cards[index].getCardNumber()}">
                                        <button class="removeaddressbtn" type="submit"><img class="removeaddressbtnimg" src="Assets/Images/remove_1.png"></button>
                                        <label style="color: black;font-weight: 600;">Card ${index + 1}: </label>${sessionScope.cards[index].getCardNumber()}
                                    </form>
                                    <c:set var="index" value="${0 + 1}"></c:set>
                                </c:forEach>
                                <label class="mutedlbl">You have added the max number of addresses. Please remove one to add another.</label>
                            </c:if>
                            <c:if test = "${sessionScope.cards.size() == 1}">
                                <form action="CustomerCard" method="GET">
                                    <input name="command" type="hidden" value="REMOVEC">
                                    <input name="card" type="hidden" value="${sessionScope.cards[0].getCardNumber()}">
                                    <button class="removeaddressbtn" type="submit"><img class="removeaddressbtnimg" src="Assets/Images/remove_1.png"></button>
                                    <label style="color: black;font-weight: 600;">Card 1: </label>${sessionScope.cards[0].getCardNumber()}
                                </form>
                                <a class="addtomyaccount" data-toggle="modal" data-target="#addCardModal">&nbsp;&nbsp;<img class="removeaddressbtnimg" src="Assets/Images/add_1.png" height="14px">&nbsp;&nbsp;Add another payment method</a>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test = "${sessionScope.cards.size() == 0}">
                        <div class="paymentinfodiv">
                            <label class="profilehead"><img style="margin-bottom: 5px;" height="55" src="Assets/Images/cards.png">&nbsp;Payment Information</label>
                            <p class="naddresstxt">You haven't saved any payment methods yet</p>
                            <a class="addtomyaccount" data-toggle="modal" data-target="#addCardModal">&nbsp;&nbsp;<img class="removeaddressbtnimg" src="Assets/Images/add_1.png" height="14px">&nbsp;&nbsp;Add a payment method</a>
                        </div>
                    </c:if>
                </div>
            </div>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav tabletmobilefn">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>
