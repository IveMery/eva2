<%-- 
    Document   : index.jsp
    Created on : 16-08-2023, 18:25:01
    Author     : ivett
--%>




<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%   Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <h1 class="text-center">Gestion de empleados</h1>
        <div class="container">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>

                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Salario</th>
                        <th scope="col">Cargo</th>
                    </tr>
                </thead>
                <tbody>
                    <% Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eva2db", "postgres", "Admin01");
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT * FROM EMPLEADOS");
                        while (rs.next()) {
                    %>
                    <tr>
                        <th scope="row"><%=rs.getLong("id")%></th>
                        <td><%= rs.getString("nombre")%></td>
                        <td><%= rs.getInt("edad")%></td>
                        <td><%= rs.getBigDecimal("salario")%></td>
                        <td><%= rs.getString("cargo")%></td>
                    </tr>

                    <%
                    }    
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
