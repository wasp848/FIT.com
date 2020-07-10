<%-- 
    Document   : manageproducts
    Created on : Apr 30, 2020, 7:17:50 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Products</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
        <script>
            function checkStock()
            {
               document.getElementById("updatestockbtn").disabled = false;
            }
        </script>
    </head>
    <body>
        <div class="modal fade" id="updateProdModal" tabindex="-1" role="dialog" aria-labelledby="updateProdModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content updateprodmodal">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="margin-left: 250px;">Update Inventory</h5>
                  <button type="button" class="close reglogclose" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-footer">
                    <c:forEach items="${requestScope.products}" var="products">
                        <form method="GET" action="AdminProduct">
                            <input name="prodID" type="hidden" value="${products.getProductID()}">
                            <input name="command" type="hidden" value="UPDATEP">
                            <table style="margin-right: -75px;">
                                <tr>
                                    <td>
                                        <label style="font-weight: bold;">${products.getProductBrand()}</label>&nbsp;${products.getProductName()}
                                    </td>
                                    <td>
                                        <input class="form-control2 fc2addp fc2prodstock" name="updateStock" type="number" id="exampleInputEmail1" aria-describedby="emailHelp" min="0" max="50" value="${products.getNumInStock()}">
                                    </td>
                                    <td>
                                        <button id="updatestockbtn" style="margin-top: -10px;margin-left: 15px;" class="btn btn-dark" type="submit">Update</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </c:forEach>
               </div>
              </div>
            </div>
          </div>
        
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark adminheader">
            <a class="navbar-brand" href="adminhome.jsp"><img class="adminheaderimg" src="Assets/Images/fitlogo2.png"></a>
            <a class="adminlogout adminmngphome" href="adminhome.jsp"><img height="33px" src="Assets/Images/home.png">&nbsp; Home</a>
            <a class="adminlogout adminmngplogout" href="Logout"><img src="Assets/Images/exit.png">&nbsp; Logout</a>
        </nav>
        
        <div class="mid manageproductsmid">
            <div class="adminproductdiv">
                <div class="adminproductsheader">
                    <table>
                        <tr>
                            <td>
                                <form id="searchproductform" class="form-inline my-2 my-lg-0" action="AdminProduct" method="GET">
                                    <input type="hidden" name="command" value="SEARCHP">
                                    <input class="form-control mr-sm-2" name="ckeyword" type="text" placeholder="Enter keyword" aria-label="Search">;
                                    <button id="searchbutton" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </td>
                            <td>
                                &nbsp;&nbsp;<a href="addproducts.jsp"><img title="Add Product" class="addprodimg" height="27" src="Assets/Images/add.png"></a>
                            </td>
                            <td>
                                &nbsp;&nbsp;<a href="addproducts.jsp" data-toggle="modal" data-target="#updateProdModal"><img title="Update Inventory" class="updateprodimg" height="30" src="Assets/Images/update.png"></a>
                            </td>
                        </tr>
                    </table>
                </div>
                
                <br>
                  <div class="adminallitemsdiv">
                        <c:forEach items="${requestScope.products}" var="products">
                        <form method="GET" action="AdminProduct">
                            <input name="prodID" type="hidden" value="${products.getProductID()}">
                            <input name="command" type="hidden" value="REMOVEP">
                            <table class="newitemstable adminitems" id="getallitemstable">
                                <td>
                                   <div class="card mb-2 product shopallproduct adminmngproduct">
                                    <div class="newitemimgdiv">
                                        <img class="newitemimg" src="${products.getProductImageDir()}" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="adminitemdescr">ID: ${products.getProductID()}<br>${products.getProductName()}<br>${products.getProductDescription()}</div><p>${products.getProductBrand()}</p>
                                      <p class="newitemprice">LKR ${products.getProductPrice()}</p>
                                      <button class="removeprodbut" type="submit"><img class="removeprodimg" height="30" src="Assets/Images/remove.png"></button>
                                    </div>
                                  </div>
                                </td>
                        </table>
                        </form>
                        </c:forEach>
                </div>
                    
                <div class="adminallitemsdiv">
                    <c:forEach items="${requestScope.sproducts}" var="sproducts">
                        <form method="GET" action="AdminProduct">
                            <input name="prodID" type="hidden" value="${sproducts.getProductID()}">
                            <input name="command" type="hidden" value="REMOVEP">
                            <table class="newitemstable adminitems" id="getallitemstable">
                                <td>
                                    <div class="card mb-2 product shopallproduct adminmngproduct">
                                        <div class="newitemimgdiv">
                                            <img class="newitemimg" src="${sproducts.getProductImageDir()}" alt="Card image cap">
                                        </div>
                                        <div class="card-body">
                                            <div class="adminitemdescr">ID: ${sproducts.getProductID()}<br>${sproducts.getProductName()}<br>${sproducts.getProductDescription()}</div><p>${sproducts.getProductBrand()}</p>
                                          <p class="newitemprice">LKR ${sproducts.getProductPrice()}</p>
                                          <button class="removeprodbut" type="submit"><img class="removeprodimg" height="30" src="Assets/Images/remove.png"></button>
                                        </div>
                                      </div>
                                </td>
                            </table>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
