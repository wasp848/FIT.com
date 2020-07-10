/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Khalid Fazal
 */
public class Order {
    int orderID;
    String email;
    //ArrayList<Item> items;
    String itemss;
    ArrayList<String> items;
    int total;
    String address;
    //Card card;
    String paymentMethod;
    long card;
    String status;

    public Order(int orderID, String email, String itemss, int total, String address, String paymentMethod, long card, String status) {
        this.orderID = orderID;
        this.email = email;
        this.itemss = itemss;
        this.total = total;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.card = card;
        this.status = status;
    }

    public Order(String email, ArrayList<String> items, int total, String address, String paymentMethod, long card) {
        this.email = email;
        this.items = items;
        this.total = total;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.card = card;
    }

    public String getItemss() {
        return itemss;
    }

    public void setItemss(String itemss) {
        this.itemss = itemss;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public long getCard() {
        return card;
    }

    public void setCard(long card) {
        this.card = card;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<String> getItems() {
        return items;
    }

    public void setItems(ArrayList<String> items) {
        this.items = items;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
