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
        <style>
            .sem-cachorro{
                background-color: #FFF;
                padding: 20px;
                margin: 0 auto;
                width: 80%;
                height: 60%;
                border-radius: 30px;
            }
            .img-sem-cachorro{
                width: 65%;
                margin: 15px 0;
            }
        </style>
        <title>Dogspace - Cães</title>
    </head>
    <body>
        <h1 id="title-lista">Lista de Cachorros</h1>
        <%
            Conexao conexao = new Conexao();
            Connection con = conexao.abreConec();
            PreparedStatement st;

            try {
                st = con.prepareStatement("select distinct raca from animal");
                ResultSet rs = st.executeQuery();
                if(!rs.isBeforeFirst()){
                    %>
                        <div class="sem-cachorro">
                            <h2>Nenhum Cachorro Cadastrado</h2>
                            <img class="img-sem-cachorro" src="./assets/img/dog-desastrado.png">
                        </div>
                    <%
                }
                while (rs.next()) {
                    String racaAtual = rs.getString("raca");
                    %>
                        <div class="campo-raca read">
                        <div class="topo-campo">
                            <span class="nome-raca"><%= racaAtual%></span>
                            <div class="img" style="background-image: url('./assets/img/<%= racaAtual%>.png')"></div>
                        </div>
                    <%
                    try {
                        st = con.prepareStatement("select * from animal where raca = '"+racaAtual+"'");
                        ResultSet r = st.executeQuery();
                        while (r.next()) {
                            %>
                                <div class="cao">
                                    <span class="id-cao">ID: <%= r.getString("id")%></span>
                                    <span class="nome-cao">Nome: <%= r.getString("nome")%></span>
                                    <span class="sexo-cao">Sexo: <%= r.getString("sexo")%></span>
                                    <span class="idade-cao">Idade: <%= r.getString("idade")%></span>
                                    <span class="peso-cao">Peso: <%= r.getString("peso")%> kg</span>
                                    <span class="cao-btn excluir"><a href="excPet.jsp?cod=<%=r.getString("id")%>">Excluir</a></span>
                                </div>
                            <%
                        }
                    } catch (Exception ex) {
                        out.print("Erro: " + ex.getMessage());
                    }
                    %>
                        </div>  
                    <%
                }
            } catch (Exception ex) {
                out.print("Erro: " + ex.getMessage());
            }


            %>
    </body>

</html>
