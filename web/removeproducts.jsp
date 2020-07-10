<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Product</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark adminheader">
            <a class="navbar-brand" href="admin.jsp"><img class="adminheaderimg" src="Assets/Images/fitlogo2.png"></a>
            <a class="adminlogout adminmngplogout" href="Logout"><img src="Assets/Images/exit.png">&nbsp; Logout</a>
        </nav>
        
        <div class="mid manageproductsmid">
            <div class="adminproductdiv">
                <div class="adminproductsheader">
                    <table>
                        <tr>
                            <td>
                                <form id="searchproductform" class="form-inline my-2 my-lg-0" action="SearchViewProduct" method="GET">
                                    <input type="hidden" name="command" value="SEARCHP">
                                    <input class="form-control mr-sm-2" name="ckeyword" type="text" placeholder="Enter keyword" aria-label="Search">;
                                    <button id="searchbutton" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
                
                <c:forEach var="tempSearchResults" items="${PRODUCT_SEARCH_LIST}">
                    <c:url var="remove" value="SearchViewProduct">
                        <c:param name="command" value="REMOVEP"/>
                        <c:param name="productID" value="${tempSearchResults.getProductID()}"/>
                    </c:url>
                    <table class="newitemstable" id="getallitemstable">
                            <td>
                                <div class="card mb-2 product adminmngproduct">
                                    <div class="newitemimgdiv">
                                        <img class="newitemimg" src="${tempSearchResults.getProductImageDir()}" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="adminitemdescr">ID: ${tempSearchResults.getProductID()}<br>${tempSearchResults.getproductName()}<br>${tempSearchResults.getProductDescription()}</div><p>${tempSearchResults.getProductBrand()}</p>
                                        <p class="newitemprice">LKR ${tempSearchResults.getProductPrice()}<br>In stock: ${tempSearchResults.getNumInStock()}</p><br>
                                        <a href="${remove}">Remove Product</a>
                                    </div>
                                  </div>
                            </td>
                    </table>
                </c:forEach>
                    
                <input type="hidden" name="command" value="VIEWP">
                <c:forEach var="tempAllResults" items="${PRODUCT_LIST}">
                    <c:url var="remove" value="SearchViewProduct">
                        <c:param name="command" value="REMOVEP"/>
                        <c:param name="productID" value="${tempAllResults.getProductID()}"/>
                    </c:url>
                    <table class="newitemstable" id="getallitemstable">
                            <td>
                                <div class="card mb-2 product adminmngproduct">
                                    <div class="newitemimgdiv">
                                        <img class="newitemimg" src="${tempAllResults.getProductImageDir()}" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <div class="adminitemdescr">ID: ${tempAllResults.getProductID()}<br>${tempAllResults.getproductName()}<br>${tempAllResults.getProductDescription()}</div><p>${tempAllResults.getProductBrand()}</p>
                                      <p class="newitemprice">LKR ${tempAllResults.getProductPrice()}<br>In stock: ${tempSearchResults.getNumInStock()}</p><br>
                                      <a href="${remove}">Remove Product</a>
                                    </div>
                                  </div>
                            </td>
                    </table>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
