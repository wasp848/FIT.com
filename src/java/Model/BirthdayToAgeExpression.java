/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

public class BirthdayToAgeExpression implements Expression{
    private String dob;

    public BirthdayToAgeExpression(String dob) {
        this.dob = dob;
    }
    
    @Override
    public int interpret(AgeInterpreter ai) {
        return ai.getAgeFromDate(this.dob);
    }
    
}
