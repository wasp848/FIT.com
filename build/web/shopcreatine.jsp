<%@page import="Model.CreatineFilter"%>
<%@page import="Model.FilterProducts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAOFactory"%>
<%@page import="Model.DAO"%>
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
        <title>FIT.com - Shop Creatine</title>
        <script src="Styling/jquery.min.js"></script>
        <script src="Styling/mdb.js"></script>
        <link rel="stylesheet" href="Styling/mdb.css">
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
        <script>
            function openNav() {
              document.getElementById("mySidenav").style.width = "300px";
            }

            function closeNav() {
              document.getElementById("mySidenav").style.width = "0";
            }
            
            function openCartNav() {
              document.getElementById("myCartSidenav").style.width = "300px";
            }

            function closeCartNav() {
              document.getElementById("myCartSidenav").style.width = "0";
            }
        </script>
    </head>
    <body style="overflow-y: scroll;">
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
                        <td class="nav-item active">
                          <a class="nav-link custoomnavitem" href="CustomerProduct">Shop</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </td>
                        <td class="nav-item">
                          <a class="nav-link custoomnavitem" href="contact.jsp">Contact Us</a>
                        </td>
                        <c:if test="${not empty email}">
                            <td class="nav-item">
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
                        <li class="nav-item active">
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
                        <li class="nav-item active">
                          <a class="nav-link" href="CustomerProduct">Shop</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link custoomnavitem" href="delivery.jsp">Delivery & Shipping</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="contact.jsp">Contact Us</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="profile.jsp">My Profile</a>
                        </li>
                    </ul>
                 </div>
            </nav>
        </c:if>
        
        <div style="position: relative;" class="homemid shopmid">
            <div class="adminproductdiv">
                <div style="position: relative;" class="adminproductsheader">
                    <table>
                        <tr>
                            <td>
                                <form id="searchproductform" class="form-inline my-2 my-lg-0 searchproductform" action="CustomerProduct" method="GET">
                                    <input type="hidden" name="command" value="SEARCHP">
                                    <input class="form-control mr-sm-2 searchinp" name="ckeyword" type="text" placeholder="Enter keyword" aria-label="Search">&nbsp;&nbsp;
                                    <button id="searchbutton" class="btn btn-outline-success my-2 my-sm-0 searchbtn" type="submit">Search</button>
                                </form>
                            </td>
                            <td>
                                <span id="filtersortnavtn" class="filternavtoggler" onclick="openNav()">Filter items</span>
                            </td>
                        </tr>
                    </table>
                </div>
                            
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a class="filtershop" href="CustomerProduct">No Filter</a>
                    <a class="filtershop" href="shopwhey.jsp">Whey Protein</a>
                    <a class="filtershop" href="shopmass.jsp">Mass Gainer</a>
                    <a class="filtershop" href="shoppre.jsp">Pre-Workout</a>
                    <a class="filtershop filtershopactive" href="shopcreatine.jsp">Creatine</a>
                    <a class="filtershop" href="shopbcaa.jsp">BCAA</a>
                </div>
                
                <div id="myCartSidenav" class="sidenav">
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
                                    <input name="url" type="hidden" value="shopcreatine.jsp">
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
                
                <div style="text-align: center !important;">
                    <c:if test="${empty email}"><label class="logintoshop">Login to start shopping</label></c:if>
                </div>
                
                    <br>
                    <div class="adminallitemsdiv filtered">
                            <%
                                DAO dao = DAOFactory.createRole("customer");
                                ArrayList<Product> products = dao.getAllProducts();
                                FilterProducts creatineFilter = new CreatineFilter();
                                ArrayList<Product> creatine = creatineFilter.filterProducts(products);
                                
                                for (Product product : creatine)
                                {
                            %>
                            <form method="GET" action="CustomerCart">
                            <input name="command" type="hidden" value="ADDC">
                            <input name="prodID" type="hidden" value="<%=product.getProductID()%>">
                            <input name="url" type="hidden" value="shopwhey.jsp">
                            <table class="newitemstable adminitems" id="getallitemstable">
                            <td>
                                <div class="card mb-2 product shopallproduct">
                                    <div class="newitemimgdiv">
                                        <img class="newitemimg" src="<%=product.getProductImageDir()%>" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="adminitemdescr"><%=product.getProductName()%><br><%=product.getProductDescription()%></div><p><%=product.getProductBrand()%></p>
                                      <p class="newitemprice">LKR <%=product.getProductPrice()%></p>
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
                        <%
                            }
                        %>
                </div>
            </div><br>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark footernav">
                 <img class="footerimg" height="75px" src="Assets/Images/fitlogo2.png">
                 <p class="h6 footertext"><strong>Copyright © 2020 <i>FIT.com</i>. All rights reserved.</strong></p>
            </nav>
        </div>
    </body>
</html>