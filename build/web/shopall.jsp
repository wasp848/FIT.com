<%-- 
    Document   : shopall
    Created on : May 12, 2020, 12:55:19 AM
    Author     : Khalid Fazal
--%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Model.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FIT.com - Shop All</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/mdb.js"></script>
        <link rel="stylesheet" href="Styling/mdb.css">
        <script src="Styling/popper.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <a class="navbar-brand" href="index.jsp"><img class="headerimg" height="100px" src="Assets/Images/fitlogo2.png"></a>
             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="about.jsp">About Us <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="routines.jsp">Routines <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                      <a class="nav-link" href="CustomerProduct">Shop</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="contact.jsp">Contact Us</a>
                    </li>
                </ul>
                 
                 <div class="headeraccount">
                      <c:if test="${not empty sessionScope.email}">
                        <a id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <img class="headerbtn" src="Assets/Images/account.png" height="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
                        <div class="dropdown-menu loggedindmenu" aria-labelledby="dLabel">
                            <button class="viewprof"><a href="profile.jsp">Go to Profile</a></button>
                            <div class="dropdown-divider"></div>
                            <button class="dropdown-item logsignup"><a href="Logout">Logout</a></button>   
                        </div>
                     </c:if>
                     <c:if test="${empty sessionScope.email}">
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
                     </c:if>
                 </div>
             </div>
        </nav>
        
        
        <div class="homemid shopmid">
            <div class="adminproductdiv">
                <div class="adminproductsheader">
                    <table>
                        <tr>
                            <td>
                                <form id="searchproductform" class="form-inline my-2 my-lg-0" action="CustomerProduct" method="GET">
                                    <input type="hidden" name="command" value="SEARCHP">
                                    <input class="form-control mr-sm-2" name="ckeyword" type="text" placeholder="Enter keyword" aria-label="Search">;
                                    <button id="searchbutton" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="filterlbl">Filter items by: </label>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;<a class="filtershop filtershopactive" href="CustomerProduct">No Filter</a>
                            </td>
                            <td>
                                &nbsp;&nbsp;<a class="filtershop" href="shopwhey.jsp">Whey Protein</a>
                            </td>
                            <td>
                                &nbsp;&nbsp;<a class="filtershop" href="shopmass.jsp">Mass Gainer</a>
                            </td>
                            <td>
                                &nbsp;&nbsp;<a class="filtershop" href="shoppre.jsp">Pre-Workout</a>
                            </td>
                            <td>
                                &nbsp;&nbsp;<a class="filtershop" href="shopcreatine.jsp">Creatine</a>
                            </td>
                            <td>
                                &nbsp;&nbsp;<a class="filtershop" href="shopbcaa.jsp">BCAA</a>
                            </td>
                        </tr>
                    </table>
                    <form id="sortform" method="GET" action="CustomerProduct">
                        <input type="hidden" name="command" value="SORTP">
                        <select name="sort" style="width: 185px;" class="custom-select my-1 mr-sm-2 sortselect" id="inlineFormCustomSelectPref">
                            <option selected>${requestScope.sortmode}</option>
                            <option value="1" onclick="document.getElementById('sortform').submit();">Default Sorting</option>
                            <option value="2" onclick="document.getElementById('sortform').submit();">Name (Ascending)</option>
                            <option value="3" onclick="document.getElementById('sortform').submit();">Name (Descending)</option>
                            <option value="4" onclick="document.getElementById('sortform').submit();">Price (Ascending)</option>
                            <option value="5" onclick="document.getElementById('sortform').submit();">Price (Descending)</option>
                        </select>
                    </form>
                </div>
                
                <c:if test="${empty email}"><label class="logintoshop">Login to start shopping</label></c:if>
                
                    <br>
                    <div class="adminallitemsdiv">
                            <c:set var="index" value="${0}"></c:set>
                            <c:forEach items="${requestScope.products}" var="products">
                            <form method="GET" action="CustomerCart">
                            <input name="command" type="hidden" value="ADDC">
                            <input name="prodID" type="hidden" value="${requestScope.products[index].getProductID()}">
                            <input name="url" type="hidden" value="shopall.jsp">
                            <table class="newitemstable" id="getallitemstable">
                            <td>
                                <div class="card mb-2 product shopallproduct">
                                    <div class="newitemimgdiv">
                                        <img class="newitemimg" src="${requestScope.products[index].getProductImageDir()}" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="adminitemdescr">${requestScope.products[index].getProductName()}<br>${requestScope.products[index].getProductDescription()}</div><p>${requestScope.products[index].getProductBrand()}</p>
                                      <p class="newitemprice">LKR ${requestScope.products[index].getProductPrice()}</p>
                                    <div class="addtocartdiv">
                                      <input type="number" name="numofitems" class="numofitems" min="1" max="5" value="1">
                                      <c:if test="${not empty email}">
                                          <button class="addtocart" type="submit">Add to cart</button>
                                      </c:if>
                                      <c:if test="${empty email}">
                                          <button class="addtocart" disabled>Add to cart</button>
                                      </c:if>
                                    </div>
                                    </div>
                                  </div>
                            </td>
                        </table>
                        </form>
                        <c:set var="index" value="${index + 1}"></c:set>
                        </c:forEach>
                </div>
                    
                <div class="adminallitemsdiv">
                            <c:set var="index" value="${0}"></c:set>
                            <c:forEach items="${requestScope.sproducts}" var="sproducts">
                            <form method="GET" action="CustomerCart">
                            <input name="command" type="hidden" value="ADDC">
                            <input name="prodID" type="hidden" value="${requestScope.sproducts[index].getProductID()}">
                            <input name="url" type="hidden" value="shopall.jsp">
                            <table class="newitemstable adminitems" id="getallitemstable">
                            <td>
                                <div class="card mb-2 product shopallproduct">
                                    <div class="newitemimgdiv">
                                        <img class="newitemimg" src="${requestScope.sproducts[index].getProductImageDir()}" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="adminitemdescr">${requestScope.sproducts[index].getProductName()}<br>${requestScope.sproducts[index].getProductDescription()}</div><p>${requestScope.sproducts[index].getProductBrand()}</p>
                                      <p class="newitemprice">LKR ${requestScope.sproducts[index].getProductPrice()}</p>
                                    <div class="addtocartdiv">
                                      <input type="number" name="numofitems" class="numofitems" min="1" max="5" value="1">
                                      <c:if test="${not empty email}">
                                          <button class="addtocart" type="submit">Add to cart</button>
                                      </c:if>
                                      <c:if test="${empty email}">
                                          <button class="addtocart" disabled>Add to cart</button>
                                      </c:if>
                                    </div>
                                    </div>
                                  </div>
                            </td>
                        </table>
                        </form>
                        <c:set var="index" value="${index + 1}"></c:set>
                        </c:forEach>
                </div>
                            
                <div class="adminallitemsdiv">
                    <c:set var="index" value="${0}"></c:set>
                    <c:forEach items="${requestScope.sortproducts}" var="sortproducts">
                        <form method="GET" action="CustomerCart">
                        <input name="command" type="hidden" value="ADDC">
                        <input name="prodID" type="hidden" value="${requestScope.sortproducts[index].getProductID()}">
                        <input name="url" type="hidden" value="shopall.jsp">
                        <table class="newitemstable adminitems" id="getallitemstable">
                        <td>
                            <div class="card mb-2 product shopallproduct">
                                <div class="newitemimgdiv">
                                    <img class="newitemimg" src="${requestScope.sortproducts[index].getProductImageDir()}" alt="Card image cap">
                                </div>
                                <div class="card-body">
                                    <div class="adminitemdescr">${requestScope.sortproducts[index].getProductName()}<br>${requestScope.sortproducts[index].getProductDescription()}</div><p>${requestScope.sortproducts[index].getProductBrand()}</p>
                                  <p class="newitemprice">LKR ${requestScope.sortproducts[index].getProductPrice()}</p>
                                <div class="addtocartdiv">
                                  <input type="number" name="numofitems" class="numofitems" min="1" max="5" value="1">
                                  <c:if test="${not empty email}">
                                      <button class="addtocart" type="submit">Add to cart</button>
                                  </c:if>
                                  <c:if test="${empty email}">
                                      <button class="addtocart" disabled>Add to cart</button>
                                  </c:if>
                                </div>
                                </div>
                              </div>
                        </td>
                    </table>
                    </form>
                    <c:set var="index" value="${index + 1}"></c:set>
                </c:forEach>
            </div>
            </div><br>
        </div>
        
            
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
             <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
        </nav>
    </body>
</html>
