<%-- 
    Document   : Eliminar
    Created on : 18 oct. 2023, 16:50:47
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Eliminar Atributo de Sesion</h1>
        <p>¿Estás seguro que quieres eliminar el atributo de sesión?</p>
        <form method="post" action= "<%=request.getContextPath() %>/VolverAEmpezar">
            <input type="submit" value="Eliminar" name="button"/>
            <input type="submit" value="Cancelar" name="button"/>
        </form>
    </body>
</html>
