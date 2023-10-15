<%-- 
    Document   : listaCao
    Created on : 12 de out. de 2023, 13:30:22
    Author     : win
--%>

<%@page import="classes.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="width=device-width; initial-scale=1.0" charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/lista.css">
        <link rel="stylesheet" href="./assets/css/reset.css"/>
        <link rel="stylesheet" href="./assets/css/erros.css">
        <link rel="stylesheet" href="./assets/css/formu.css"/>
                <style>
            .sem-cachorro{
                background-color: #FFF;
                padding: 20px;
                margin: 15px auto;
                width: 100%;
                height: 70%;
                border-radius: 30px;
            }
            .img-sem-cachorro{
                width: 100%;
            }
        </style>
        <title>Dogspace - Alterar</title>
    </head>
    <body>
        <form action="alterar.jsp">
            <h1>Altere os dados</h1>
        <%
            int id = Integer.parseInt(request.getParameter("cod"));
            Conexao conexao = new Conexao();
            Connection con = conexao.abreConec();
            PreparedStatement st;

            try {
                st = con.prepareStatement("select * from animal where id = ?");
                st.setInt(1,id);
                ResultSet rs = st.executeQuery();
                if(!rs.isBeforeFirst()){
                    %>
                        <div class="sem-cachorro">
                            <h2>Cachorro não encontrado</h2>
                            <img class="img-sem-cachorro" src="./assets/img/dog-desastrado.png">
                        </div>
                    <%
                } else {
                    while(rs.next()){
                    String nome = rs.getString("nome");
                    String raca = rs.getString("raca");
                    String idade = rs.getString("idade");
                    String peso = rs.getString("peso");
                    String sexo = rs.getString("sexo");
              
                    %>
                        <div class="input-field">
                            <label for="cod">Id</label>
                            <input placeholder="Ex: 1" type="number" value="<%= id%>" id="cod" name="cod" readonly>
                        </div>
                        <div class="input-field">
                            <label for="nome">Nome</label>
                            <input placeholder="Ex: Spike" maxlength="40" value="<%= nome%>" type="text" id="nome" name="nome">
                        </div>
                        <div class="input-field">
                            <label for="sexo">Sexo</label>
                            <select name="sexo" id="sexo">
                                <option value="Macho" <%= "Macho".equals(sexo) ? "selected" : "" %>>Macho</option>
                                <option value="Fêmea" <%= "Fêmea".equals(sexo) ? "selected" : "" %>>Fêmea</option>
                            </select>
                        </div>
                        <div class="input-field">
                            <label for="idade">Idade</label>
                            <input type="number" placeholder="Ex: 2" value="<%= idade%>" max="30" min="0" id="idade" name="idade">
                        </div>
                        <div class="input-field">
                            <label for="peso">Peso</label>
                            <input placeholder="Ex: 5.84" value="<%= peso%>" type="number" min="0" step="0.1" id="peso" name="peso">
                        </div>
                        <div class="input-field">
                            <label for="raca">Raça</label>
                            <select name="raca" id="raca">
                                <option value="Pinscher" <%= "Pinscher".equals(raca) ? "selected" : "" %>>Pinscher</option>
                                <option value="Pug" <%= "Pug".equals(raca) ? "selected" : "" %>>Pug</option>
                                <option value="SRD (Sem Raça Definida)" <%= "SRD (Sem Raça Definida)".equals(raca) ? "selected" : "" %>>SRD</option>
                                <option value="Bulldog" <%= "Bulldog".equals(raca) ? "selected" : "" %>>Bulldog</option>
                                <option value="Shih Tzu" <%= "Shih Tzu".equals(raca) ? "selected" : "" %>>Shih Tzu</option>
                                <option value="Yorkshire" <%= "Yorkshire".equals(raca) ? "selected" : "" %>>Yorkshire</option>
                                <option value="Border Collie" <%= "Border Collie".equals(raca) ? "selected" : "" %>>Border Collie</option>
                                <option value="Spitz Alemão" <%= "Spits Alemão".equals(raca) ? "selected" : "" %>>Spitz Alemão</option>
                                <option value="Golden Retriever" <%= "Golden Retriever".equals(raca) ? "selected" : "" %>>Golden Retriever</option>
                            </select>
                        </div>
                        <div class="input-field submit">
                            <input id="sub" type="submit" value="Alterar">
                        </div>
                    <%
                }
                    
                }
            } catch (Exception ex) {
                out.print("Erro: " + ex.getMessage());
            }
        %>
        </form>
    </body>

</html>
