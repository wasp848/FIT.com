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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FIT.com - My Profile</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/mdb.js"></script>
        <link rel="stylesheet" href="Styling/mdb.css">
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png"/>
    </head>
    <body style="overflow-y: scroll;">
        <div class="modal fade" id="updateContactModal" tabindex="-1" role="dialog" aria-labelledby="updateProdModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content updateprodmodal">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="margin-left: 230px;">Update Contact Number</h5>
                  <button type="button" class="close reglogclose" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-footer">
                    <form method="GET" action="EditProfile">
                        <input name="command" type="hidden" value="UPDC">
                        <table style="margin-left: -50px;">
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="updateContact" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" maxlength="12" placeholder="+94771234535">
                                </td>
                                <td>
                                    <button id="updatestockbtn" style="margin-top: -10px;margin-left: 15px;" class="btn btn-dark" type="submit">Update</button>
                                </td>
                            </tr>
                        </table>
                    </form>
               </div>
              </div>
            </div>
          </div>
        
        <div class="modal fade" id="addAddressModal" tabindex="-1" role="dialog" aria-labelledby="updateProdModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content updateprodmodal">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="margin-left: 275px;">Add Address</h5>
                  <button type="button" class="close reglogclose" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-footer">
                    <form method="GET" action="CustomerAddress">
                        <input name="command" type="hidden" value="ADDA">
                        <table style="margin-right: 80px;">
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="address" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Address">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="city" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="City">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="province" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Province">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="postal" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="[0-9]*" minlength="5" maxlength="5" placeholder="ZIP Code">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button id="updatestockbtn" style="margin-left: 140px;" class="btn btn-dark" type="submit">Add Address</button>
                                </td>
                            </tr>
                        </table>
                    </form>
               </div>
              </div>
            </div>
          </div>
        
        <div class="modal fade" id="addCardModal" tabindex="-1" role="dialog" aria-labelledby="updateProdModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content updateprodmodal">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="margin-left: 275px;">Add Card</h5>
                  <button type="button" class="close reglogclose" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-footer">
                    <form method="GET" action="CustomerCard">
                        <input name="command" type="hidden" value="ADDC">
                        <table style="margin-right: 80px;">
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="name" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Name on Card">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="number" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Card Number" pattern="[0-9]*" minlength="16" maxlength="16">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input style="width: 125px !important;" class="form-control2 fc2addp" name="month" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Month (Eg:02)" pattern="[0-9]*" minlength="2" maxlength="2">
                                </td>
                                <td>
                                    <input style="width: 125px !important;margin-left: -127px;" class="form-control2 fc2addp" name="year" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Year (Eg:24)" pattern="[0-9]*" minlength="2" maxlength="2">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-control2 fc2addp" name="cvv" type="text" id="exampleInputEmail1" aria-describedby="emailHelp" pattern="[0-9]*" minlength="3" maxlength="3" placeholder="CVV">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button id="updatestockbtn" style="margin-left: 140px;" class="btn btn-dark" type="submit">Add Card</button>
                                </td>
                            </tr>
                        </table>
                    </form>
               </div>
              </div>
            </div>
          </div>
        
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="about.jsp">About Us <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="routines.jsp">Routines <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="CustomerProduct">Shop</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="contact.jsp">Contact Us</a>
                    </li>
                </ul>
                 <div class="headeraccount">
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
                     <c:if test="${empty email}">
                        <a id="accountd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <img class="headerbtn" src="Assets/Images/account.png" height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
                        <div class="dropdown-menu reglogdmenu" aria-labelledby="accountd">
                            <form class="px-4 py-3" action="Login" method="POST">
                             <div class="form-group">
                                 <label class="accmodallbl" for="exampleDropdownFormEmail1">Email address</label>
                               <input type="email" name="mail" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
                             </div>
                             <div class="form-group">
                               <label class="accmodallbl" for="exampleDropdownFormPassword1">Password</label>
                               <input type="password" name="pwd" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                             </div>
                             <button type="submit" class="btn btn-primary">Sign in</button>
                           </form>
                           <div class="dropdown-divider"></div>
                           <button class="dropdown-item logsignup"><a href="register.jsp">New around here? Sign up</a></button>   
                         </div>
                     </c:if>
                 </div>
                 <div class="headercart">
                     <c:if test="${empty email}">
                        <a id="cartd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <img class="headerbtn" src="Assets/Images/cart.png" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
                        <div class="dropdown-menu emptycartdmenu" aria-labelledby="emptycartd">
                            <p class="cartisempty">Log in to shop</p>  
                        </div>
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
             </div>
        </nav>
        
        
        <div style="padding: 10px;background-color: white;min-height: 475px;color: black;">
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
    </body>
</html>
