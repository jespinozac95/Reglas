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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.parser.JSONParser;
import Modelos.regla;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Josue
 */
@WebServlet(name = "Consultar", urlPatterns = {"/Consultar"})
public class Consultar extends HttpServlet {

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
            out.println("<title>Servlet Consultar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Consultar at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/index.htm").forward(request, response);
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

    PrintWriter out;
    out = response.getWriter();
    request.setCharacterEncoding("UTF-8");
    String usuario = request.getParameter("usuario");
    request.setAttribute("usuario", usuario);
    
    List<String> tipos = new ArrayList<String>();
        tipos.add("Valores_válidos");
        tipos.add("Formato");
        tipos.add("Referencia");
        tipos.add("Dependencia");
        tipos.add("Históricos");
        tipos.add("Otros");
    List<String> entidades = new ArrayList<String>();
    List<String> atributos = new ArrayList<String>();
    
    // cargar todas las reglas
    List<regla> reglas = new ArrayList<regla>();
        
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
                consulta = connection.prepareStatement(" "+ 
"select r.idRegla, nombreRegla, definicionFormal, definicionInformal, tipo, codigosql as sql, re.nombreEntidad, ra.nombreAtributo from reglas.regla r" +
" inner join reglas.regla_entidad re on re.idRegla = r.idRegla" +
" inner join reglas.atributo_regla ra on ra.idRegla = r.idRegla; ");
                ResultSet rs = consulta.executeQuery();

                while (rs.next()) {
                    regla r = new regla();
                    
                    r.setId(rs.getInt("idRegla"));                    
                    r.setNombre(rs.getString("nombreRegla"));                    
                    r.setDefinicionFormal(rs.getString("definicionFormal"));                    
                    r.setDefinicionInformal(rs.getString("definicionInformal"));                    
                    r.setTipo(rs.getString("tipo"));                    
                    r.setSql(rs.getString("sql"));                    
                    r.setEntidad(rs.getString("nombreEntidad"));                    
                    r.setAtributo(rs.getString("nombreAtributo"));                    
                    
                    reglas.add(r);
                }
                rs.close();
                consulta.close();

                PreparedStatement consulta3;
                consulta3 = connection.prepareStatement(" SELECT * FROM reglas.entidad; ");
                ResultSet rs3 = consulta3.executeQuery();

                while (rs3.next()) {
                    entidades.add(rs3.getString("nombreEntidad"));
                }
                rs3.close();
                consulta3.close();

                PreparedStatement consulta2;
                consulta2 = connection.prepareStatement(" SELECT * FROM reglas.atributo; ");
                ResultSet rs2 = consulta2.executeQuery();

                while (rs2.next()) {
                    atributos.add(rs2.getString("nombreAtributo"));
                }
                rs2.close();
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
        
    request.setAttribute("entidades", entidades);
    request.setAttribute("atributos", atributos);
    request.setAttribute("tipos", tipos);
    request.setAttribute("reglas", reglas);
    redireccionar(request, response, "/Catalogo/listado.jsp");
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
