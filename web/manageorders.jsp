<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="Styling/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styling/bootstrap.min.css">
        <link rel="icon" type="image/ico" href="Assets/Images/fitlogo.png"/>
        <script>
            function checkstatus()
            {
               document.getElementById("updateorderbtn").disabled = false;
            }
            function checkstatus1()
            {
               document.getElementById("updateorderbtn").disabled = true;
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark adminheader">
            <a class="navbar-brand" href="adminhome.jsp"><img class="adminheaderimg" src="Assets/Images/fitlogo2.png"></a>
            <a class="adminlogout adminmngphome" href="adminhome.jsp"><img height="33px" src="Assets/Images/home.png">&nbsp; Home</a>
            <a class="adminlogout adminmngplogout" href="Logout"><img src="Assets/Images/exit.png">&nbsp; Logout</a>
        </nav>
        
        <div class="mid viewusersmid">
            <div class="adminusersdiv">
                <table class="table">
                    <thead class="thead-dark">
                      <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Customer E-Mail</th>
                        <th scope="col">Items</th>
                        <th scope="col">Total</th>
                        <th scope="col">Address</th>
                        <th scope="col">Payment Method</th>
                        <th scope="col">Card Number</th>
                        <th scope="col">Status</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.orders}" var="orders">
                            <tr>
                              <td>${orders.getOrderID()}</td>
                              <td>${orders.getEmail()}</td>
                              <td>${orders.getItemss().replaceAll("(^\\[|\\]$)", "")}</td>
                              <td>${orders.getTotal()}</td>
                              <td>${orders.getAddress()}</td>
                              <td>${orders.getPaymentMethod()}</td>
                              <c:if test="${orders.getCard() == 0}">
                                  <td>N/A</td>
                              </c:if>
                              <c:if test="${orders.getCard() != 0}">
                                <td>${orders.getCard()}</td>
                              </c:if>
                              <c:if test="${orders.getStatus() != 'Complete'}">
                                <td>
                                    <select name="status" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                      <option selected>${orders.getStatus()}</option>
                                      <option value="Complete">Complete</option>
                                  </select>
                                </td>
                                <td>
                                    <form method="GET" action="AdminOrders">
                                        <input type="hidden" name="command" value="UPDATEO">
                                        <input type="hidden" name="orderID" value="${orders.getOrderID()}">
                                        <input type="hidden" name="orderStatus" value="Complete">
                                        <button id="updateorderbtn" style="margin-top: 4px;" class="btn btn-dark" type="submit">Update</button>
                                    </form>
                                </td>
                              </c:if>
                              <c:if test="${orders.getStatus() == 'Complete'}">
                                    <td>${orders.getStatus()}</td>
                                    <td>
                                        <button id="updateorderbtn" style="margin-top: 4px;" class="btn btn-dark" type="submit" disabled>Update</button>
                                    </td>
                              </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                  </table>
            </div>
        </div>
    </body>
</html>
