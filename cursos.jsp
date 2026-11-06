<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Cursos - IA Generativa</title>
    <!-- Bootstrap 5 CDN para diseño responsivo -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light"> <!-- Diseño Dark Mode -->
    <div class="container mt-5">
        <h1 class="text-center mb-4 text-info">Cursos de Inteligencia Artificial Generativa</h1>
        <p class="text-center mb-5">Aprende sobre herramientas, ventajas, tips y cómo interactuar con la IA.</p>
        
        <div class="row">
            <%
                String url = "jdbc:mysql://localhost:3306/ia_generativa_db";
                String usuario = "root"; // Cambia por tu usuario de MySQL
                String password = "";    // Cambia por tu contraseña de MySQL
                
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, usuario, password);
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM cursos");
                    
                    while(rs.next()) {
            %>
            <!-- Tarjeta responsiva para cada curso -->
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card bg-secondary text-white h-100 shadow">
                    <div class="card-body">
                        <h5 class="card-title text-warning"><%= rs.getString("nombre") %></h5>
                        <h6 class="card-subtitle mb-2 text-light">Inicio: <%= rs.getString("fecha_inicio") %></h6>
                        <p class="card-text"><strong>Descripción:</strong> <%= rs.getString("descripcion") %></p>
                        <p class="card-text"><small><strong>Requisitos:</strong> <%= rs.getString("requisitos") %></small></p>
                    </div>
                    <div class="card-footer text-center">
                        <button class="btn btn-outline-info w-100">Ver Detalles del Curso</button>
                    </div>
                </div>
            </div>
            <%
                    }
                } catch(Exception e) {
                    out.println("<div class='alert alert-danger'>Error de conexión: " + e.getMessage() + "</div>");
                } finally {
                    if(rs != null) rs.close();
                    if(stmt != null) stmt.close();
                    if(conn != null) conn.close();
                }
            %>
        </div>
    </div>
</body>
</html>