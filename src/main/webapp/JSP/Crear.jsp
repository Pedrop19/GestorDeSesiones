<%-- 
    Document   : Crear
    Created on : 18 oct. 2023, 16:50:22
    Author     : Pedro Lazaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="es.albarregas.beans.Persona"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="es.albarregas.enums.tipo_Identificacion"%>

<%
        Persona persona = (Persona) request.getSession().getAttribute("persona");
        boolean isDNISelected = false;
        boolean isNIFSelected = false;
        boolean isPasaporteSelected = false;
        String fecha = "";

    if (persona != null) {
    isDNISelected = (persona.getTipo_identificacion() == tipo_Identificacion.DNI);
    isNIFSelected = (persona.getTipo_identificacion() == tipo_Identificacion.NIF);
    isPasaporteSelected = (persona.getTipo_identificacion() == tipo_Identificacion.PASAPORTE);

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    fecha = sdf.format(persona.getFecha());
    }
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
        <h3><%= request.getSession().getAttribute("persona") != null ? "Modificar Atributo de Sesión" : "Crear Atributo de Sesión" %></h3>

        <p class= "<%= request.getAttribute("error") == null ? "visible" : "" %>">Todos los atributos son necesarios</p>
        <form method="post" action= "<%=request.getContextPath() %>/VolverAEmpezar">
            <label for="id">Id: </label>
            <input type=number name="id" value="<%= request.getSession().getAttribute("persona") != null ? persona.getId() : "" %>">
            <br>
            <label for="nombre">Nombre: </label>
            <input type="text" name="nombre" id="nombre" value="<%= request.getSession().getAttribute("persona") != null ? persona.getNombre() : "" %>"     >
            <br>
            <label for="fecha">Fecha: </label>
            <input type="date" name="fecha" id="fecha" value="<%= request.getSession().getAttribute("persona") != null ? fecha : "" %>">
            <br>
            <label for="tipo">Tipo: </label>
            <select name="tipo">
                <option value="DNI" <%= isDNISelected ? "selected" : "" %> >DNI</option>
                <option value="PASAPORTE" <%= isNIFSelected ? "selected" : "" %>>NIF</option>
                <option value="NIF" <%= isPasaporteSelected ? "selected" : "" %>>PASAPORTE</option>
            </select>
            <br>
            <label for="nIdent">Número: </label>
            <input type="text" name="nIdent" id="nIdent" value="<%= request.getSession().getAttribute("persona") != null ? persona.getIdentificacion() : "" %>">
            <br>
            <input type="submit" name="button" value="<%= request.getSession().getAttribute("persona") != null ? "Modificar" : "Crear" %>">
            <input type="submit" value="Cancelar" name="button"/>
        </form>
    </body>
</html>
