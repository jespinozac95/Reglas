/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import Utilidades.HelpersHTML;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.parser.JSONParser;

/**
 *
 * @author Josue
 */
@WebServlet(name = "ConsultarRegla", urlPatterns = {"/Catalogo/ConsultarRegla"})
public class ConsultarRegla extends HttpServlet {

    private final HelpersHTML helper = HelpersHTML.getSingletonHelpersHTML();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultarRegla</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultarRegla at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    PrintWriter out;
    out = response.getWriter();
    request.setCharacterEncoding("UTF-8");
    
    HelpersHTML h = new HelpersHTML();
    
    String usuario = request.getParameter("usuario");
    int idRegla = Integer.parseInt(request.getParameter("idRegla"));
    String entidad = null;
    String atributo = null;
    String tipo = null;
    String sql = null;
    String nombreRegla = null;
    String definicionFormal = null;
    String definicionInformal = null;

    request.setAttribute("usuario", usuario);
    
    // get entidades, atributos y tipos
    try {
        Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
        System.out.println("Where is your PostgreSQL JDBC Driver? "
                + "Include in your library path!");
        e.printStackTrace();
        return;
    }
    Connection connection = null;
    try {
        connection = DriverManager.getConnection(
                "jdbc:postgresql://127.0.0.1:5432/reglas", "postgres",
                "Solaris2014");
    } catch (SQLException e) {
        
        System.out.println("Connection Failed! Check output console");
        e.printStackTrace();
        return;
    }
    if (connection != null) {
        try {
            PreparedStatement consulta;
            consulta = connection.prepareStatement(" SELECT * FROM reglas.regla_entidad where idRegla = "+idRegla+"; ");
            ResultSet rs = consulta.executeQuery();
            
            while (rs.next()) {
                entidad = rs.getString("nombreEntidad");
            }
            rs.close();
            consulta.close();
            
            PreparedStatement consulta2;
            consulta2 = connection.prepareStatement(" SELECT * FROM reglas.atributo_regla where idRegla = "+idRegla+"; ");
            ResultSet rs2 = consulta2.executeQuery();
            
            while (rs2.next()) {
                atributo = rs2.getString("nombreAtributo");
            }
            rs2.close();
            
            PreparedStatement consulta3;
            consulta3 = connection.prepareStatement(" SELECT * FROM reglas.regla where idRegla = "+idRegla+"; ");
            ResultSet rs3 = consulta3.executeQuery();
            
            while (rs3.next()) {
                nombreRegla = rs3.getString("nombreRegla");
                tipo = rs3.getString("tipo");
                sql = rs3.getString("codigosql");
                definicionFormal = rs3.getString("definicionFormal");
                definicionInformal = rs3.getString("definicionInformal");
            }
            rs3.close();
            
            consulta2.close();
            
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Se produjo un error al procesar la solicitud");
        }
        //return resultado;
    } else {
        System.out.println("Failed to make connection!");
    }
    
    request.setAttribute("id", idRegla);
    request.setAttribute("entidad", entidad);
    request.setAttribute("atributo", atributo);
    request.setAttribute("tipo", tipo);
    request.setAttribute("sql", sql);
    request.setAttribute("nombre", nombreRegla);
    request.setAttribute("definicionFormal", definicionFormal);
    request.setAttribute("definicionInformal", definicionInformal);
    
    redireccionar(request, response, "/Catalogo/consultarRegla.jsp");
    
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    protected void redireccionar(HttpServletRequest request, HttpServletResponse response, String redireccion) throws ServletException, IOException {
        RequestDispatcher vista = request.getRequestDispatcher(redireccion);
        vista.forward(request, response);
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
