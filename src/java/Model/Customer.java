/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author Khalid Fazal
 */
public class Customer extends User{
    private double height, weight, BMI;
    private String address;

    public Customer(String email, String firstName, String lastName, String gender, String password, long contactNumber, LocalDate dob, int age, double height, double weight, double BMI) {
        super(email, firstName, lastName, gender, password, contactNumber, age, dob);
        this.height = height;
        this.weight = weight;
        this.BMI = BMI;
    }
    
    public Customer(String email, String firstName, String lastName, String gender, String password, long contactNumber, LocalDate dob, int age) {
        super(email, firstName, lastName, gender, password, contactNumber, age, dob);
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Customer(String email, String password) {
        super(email, password);
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getBMI() {
        return BMI;
    }

    public void setBMI(double BMI) {
        this.BMI = BMI;
    }
}
