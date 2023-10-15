<%-- 
    Document   : alterar
    Created on : 15 de out. de 2023, 08:40:50
    Author     : win
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/erros.css">
        <link rel="stylesheet" href="./assets/css/reset.css"/>
        <title>Dogspace - Alterar</title>
    </head>
    <body>
        <%
            String nome, raca, sexo;
            int idade, id;
            double peso;
            nome = request.getParameter("nome");
            id = Integer.parseInt(request.getParameter("cod"));
            raca = request.getParameter("raca");
            
            if(nome.equals("")){
                nome = null;
            }

            if(request.getParameter("idade").equals("") || request.getParameter("peso").equals("")){
               idade = 1;
               peso = 1;
               nome = null;
            }
            else{
                idade = Integer.parseInt(request.getParameter("idade"));
                peso = Double.parseDouble(request.getParameter("peso")); 
            }
            sexo = request.getParameter("sexo");
  
            Conexao conexao = new Conexao();
            Connection con = conexao.abreConec();
            PreparedStatement st;
            
            try{
                st = con.prepareStatement("update animal set nome = ? , raca = ? "
                + ", idade = ? , peso = ?, sexo = ? where id = ?");
                st.setString(1, nome);
                st.setString(2, raca);
                st.setInt(3, idade);
                st.setDouble(4, peso);
                st.setString(5, sexo);
                st.setInt(6, id);
                st.executeUpdate();
                %>
                    <div class="feedback">
                        <h1>Alterado com sucesso!</h1>
                        <img src="./assets/img/dog-feliz.jpg">
                    </div>
                <%
            }
            catch(Exception ex){
                String erro = ex.getMessage();
                if(erro.contains("null")){
                    %>
                    
                        <div class="feedback">
                        <h1>Parece que você deixou algum campo vazio na hora de alterar as informações.</h1>
                        <img src="./assets/img/dog-erro.jpg">
                        </div>
                    
                    <%
                }
                else{
                    %>
                    
                        <div class="feedback">
                            <h1>Erro</h1>
                            <div class="erro">
                                <%= erro%>
                            </div>    
                            <img src="./assets/img/dog-erro.jpg">
                        </div>
                    
                    <%
                }
                
            }
        %>
    </body>
</html>
