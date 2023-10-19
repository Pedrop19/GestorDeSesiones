<%-- 
    Document   : Visualizar
    Created on : 18 oct. 2023, 16:50:33
    Author     : Pedro Lazaro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="es.albarregas.beans.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Persona persona = (Persona) request.getSession().getAttribute("persona");

    SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
    String fecha = sf.format(persona.getFecha());
%>
<!DOCTYPE html>
<html>
<html lang="es">
    <head>
        <%@include file="/INC/metas.inc"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%= request.getContextPath() %>/CSS/styles.css" rel="stylesheet" type="text/css">
        <title>Crear</title>
    </head>
    <body>
        <h3>Visualizar Atributo de Sesión</h3>
        <table>
            <tr>
                <td>Id: </td>
                <td><%= persona.getId() %></td>
            </tr>
            <tr>
                <td>Nombre: </td>
                <td><%= persona.getNombre() %></td>
            </tr>
            <tr>
                <td>Fecha: </td>
                <td><%= fecha %></td>
            </tr>
            <tr>
                <td>Tipo de identificación: </td>
                <td><%= persona.getTipo_identificacion() %></td>
            </tr>
            <tr>
                <td>Identificación: </td>
                <td><%= persona.getIdentificacion() %></td>
            </tr>
        </table>
        <form method="post" action= "<%=request.getContextPath() %>/VolverAEmpezar">
            <input type="submit" value="Cancelar" name="button"/>
        </form>
    </body>
</html>