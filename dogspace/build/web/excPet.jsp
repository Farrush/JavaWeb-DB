<%-- 
    Document   : excPet
    Created on : 13 de out. de 2023, 09:44:21
    Author     : win
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/erros.css">
        <link rel="stylesheet" href="./assets/css/reset.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int cod = -1;
            if(!request.getParameter("cod").equals("")){
                cod = Integer.parseInt(request.getParameter("cod"));
            }
  
            Conexao conexao = new Conexao();
            Connection con = conexao.abreConec();
            PreparedStatement st;
            
            try{
                st = con.prepareStatement("delete from animal where id = ?");
                st.setInt(1, cod);
                int res = st.executeUpdate();
                if(res == 1){
                %>
                    <div class="feedback">
                        <h1>Excluído com sucesso!</h1>
                        <img src="./assets/img/dog-feliz.jpg">
                    </div>
                <%
                }
                else{
                    %>
                        <div class="feedback">
                        <h1>Esse código não existe</h1>
                        <p class="erro">
                            O código não está cadastrado no banco de dados.
                        </p>   
                        <img src="./assets/img/dog-erro.jpg">
                        </div>
                    <%
                }
            }
            catch(Exception ex){
                String erro = ex.getMessage();
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
        %>
    </body>
</html>
