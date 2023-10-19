/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.albarregas.beans.Persona;
import es.albarregas.enums.tipo_Identificacion;

/**
 *
 * @author Pedro Lazaro
 */
@WebServlet(name = "VolverAEmpezar", urlPatterns = { "/VolverAEmpezar" })
public class VolverAEmpezar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VolverAEmpezar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VolverAEmpezar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String boton = request.getParameter("button");

        // Si el boton es eliminar, elimino la sesion y redirijo a index.jsp
        switch (boton) {
            case "Eliminar":
                request.getSession().removeAttribute("persona");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "Cancelar":
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            default:
                boolean error = false;

                if (request.getParameter("id").equals("") || request.getParameter("nombre").equals("")
                        || request.getParameter("nIdent").equals("") || request.getParameter("fecha").equals("")) {
                    error = true;
                }

                if (!error) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String nombre = request.getParameter("nombre");
                    String fecha = request.getParameter("fecha");
                    // Formateo la fecha
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = null;
                    try {
                        date = sdf.parse(fecha);
                    } catch (Exception e) {
                        System.out.println("Error al parsear la fecha");
                    }
                    String tipo_identificacion = request.getParameter("tipo");
                    String nIdent = request.getParameter("nIdent");
                    tipo_Identificacion tipo_Identificacion2 = null;
                    switch (tipo_identificacion) {
                        case "DNI":
                            tipo_Identificacion2 = tipo_Identificacion.DNI;
                            break;
                        case "NIF":
                            tipo_Identificacion2 = tipo_Identificacion.NIF;
                            break;
                        case "PASAPORTE":
                            tipo_Identificacion2 = tipo_Identificacion.PASAPORTE;
                            break;
                    }
                    Persona persona = new Persona(id, nombre, date, tipo_Identificacion2, nIdent);
                    request.getSession().setAttribute("persona", persona);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("JSP/Crear.jsp").forward(request, response);
                }
                break;
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short descri"
                + "ption";
    }// </editor-fold>

}
