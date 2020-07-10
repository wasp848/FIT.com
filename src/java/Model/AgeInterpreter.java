/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author Khalid Fazal
 */
public class AgeInterpreter {
    public int getAgeFromDate(String dob)
    {
        LocalDate brthld = LocalDate.parse(dob);
        LocalDate date = LocalDate.now();
        Period diff = Period.between(brthld, date);
        int age = diff.getYears();
        return age;
    }
}
