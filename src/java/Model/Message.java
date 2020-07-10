/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Khalid Fazal
 */
public class Message {
    int id;
    String email, fullname, message, reply;
    
    public Message(int id, String email, String fullname, String message, String reply) {
        this.id = id;
        this.email = email;
        this.fullname = fullname;
        this.message = message;
        this.reply = reply;
    }
    
    public Message(int id, String email, String fullname, String message) {
        this.id = id;
        this.email = email;
        this.fullname = fullname;
        this.message = message;
    }

    public Message(int id, String message, String reply) {
        this.id = id;
        this.message = message;
        this.reply = reply;
    }

    public Message(int id, String reply) {
        this.id = id;
        this.reply = reply;
    }
    
    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
