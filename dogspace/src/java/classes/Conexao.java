package classes;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author win
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
    public String url;
    public String user;
    public String password;

    public Conexao() {
        this.url = "jdbc:mysql://localhost:3306/dogspace";
        this.password = "root";
        this.user = "root";
    }
    public Connection abreConec() throws Exception{
    Connection con;
    //Diz onde está a classe do driver que faz comunicação do java com bd
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(getUrl(), getUser(), getPass());
    return con;
    }
    private String getUrl(){
        return this.url;
    }
    private String getUser(){
        return this.user;
    }
    private String getPass(){
        return this.password;
    }
}
