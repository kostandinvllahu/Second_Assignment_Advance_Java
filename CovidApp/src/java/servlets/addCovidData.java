/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import utils.dbUtil;


/**
 *
 * @author user
 */
@WebServlet(name = "addCovidData", urlPatterns = {"/add-data"})
public class addCovidData extends HttpServlet {

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
        try {
            String iso = request.getParameter("iso").toString();
            String date = dbUtil.getDate();
            String location = request.getParameter("loc").toString();
            String death = request.getParameter("death").toString();
            String cases = request.getParameter("cases").toString();
            String vacc = request.getParameter("vacc").toString();
            Connection c = dbUtil.getConnection();
            String SQL = "INSERT INTO data values('%s','%s','%s','','%s','','%s','','%s') ON DUPLICATE KEY "
                    + "UPDATE new_cases = '%s',new_deaths='%s',fully_vaccinated='%s'"
                            .formatted(iso, date, location, death, cases, vacc, cases, death, vacc);
            System.out.println(SQL);
            Statement s = c.createStatement();
            s.executeUpdate(SQL);
            c.close();
            response.getWriter().write("200");
        } catch (Exception e) {
            response.getWriter().write(e.getLocalizedMessage());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
