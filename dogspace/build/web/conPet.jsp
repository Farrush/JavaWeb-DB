<%-- 
    Document   : conPet
    Created on : 14 de out. de 2023, 09:48:33
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/lista.css">
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/erros.css">
        <title>Consulta</title>
        <style>
            .sem-cachorro{
                background-color: #FFF;
                padding: 20px;
                margin: 15px auto;
                width: 100%;
                height: 80%;
                border-radius: 30px;
            }
            .img-sem-cachorro{
                width: 60%;
                margin: 10px 0;
            }
        </style>
    </head>
    <body>
        <%
            String nome;
            nome = request.getParameter("nome");
            Conexao conexao = new Conexao();
            Connection con = conexao.abreConec();
            PreparedStatement st;

            try {
                st = con.prepareStatement("select distinct raca from animal where nome like ?");
                st.setString(1, "%"+nome+"%");
                ResultSet rs = st.executeQuery();
                if(!rs.isBeforeFirst()){
                    %>
                        <div class="sem-cachorro">
                            <h2>Nenhum Cachorro Encontrado</h2>
                            <img class="img-sem-cachorro" src="./assets/img/dog-desastrado.png">
                        </div>
                    <%
                }
                while (rs.next()) {
                    String racaAtual = rs.getString("raca");
                    %>
                        <div class="campo-raca consult">
                        <div class="topo-campo">
                            <span class="nome-raca"><%= racaAtual%></span>
                            <div class="img" style="background-image: url('./assets/img/<%= racaAtual%>.png')"></div>
                        </div>
                    <%
                    try {
                        st = con.prepareStatement("select * from animal where raca = '"+racaAtual+"' and nome like ?");
                        st.setString(1, "%"+nome+"%");
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
