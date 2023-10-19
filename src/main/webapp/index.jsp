<%-- 
    Document   : index
    Created on : 18 oct. 2023, 16:50:10
    Author     : Pedro Lazaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="es">
    <head>
        <%@include file="/INC/metas.inc"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%= request.getContextPath() %>/CSS/styles.css" rel="stylesheet" type="text/css">
        <title>Menu</title>
    </head>
    <body>
        <h2>Sesiones</h2>
        <p>¿Qué quieres hacer?</p>
        <form action="<%=request.getContextPath()%>/FrontController" method="post">
        <button type="submit" <%= request.getSession().getAttribute("persona") != null ? "disabled" : "" %> name="button" value="Crear">Crear</button>
        <button type="submit" <%= request.getSession().getAttribute("persona") == null ? "disabled" : "" %> name="button" value="Visualizar">Visualizar</button>
        <button type="submit" <%= request.getSession().getAttribute("persona") == null ? "disabled" : "" %> name="button" value="Modificar">Modificar</button>
        <button type="submit" <%= request.getSession().getAttribute("persona") == null ? "disabled" : "" %> name="button" value="Eliminar">Eliminar</button>
        </form>
    </body>
</html>