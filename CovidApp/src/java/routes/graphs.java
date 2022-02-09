/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;


import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import utils.dbUtil;


/**
 *
 * @author user
 */
@WebServlet(name = "graphs", urlPatterns = {"/graphs"})
public class graphs extends HttpServlet {

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
            JSONArray res = new JSONArray();
            String SQL = "select iso_code,location, sum(new_cases) as cases,sum(new_deaths) as deaths, sum(fully_vaccinated) as vaccinated from data group by iso_code,location";
            Connection c = dbUtil.getConnection();
            ResultSet rs = c.createStatement().executeQuery(SQL);
            ArrayList<String> labels = new ArrayList<String>();
            ArrayList<String> c_values = new ArrayList<>();
            ArrayList<String> d_values = new ArrayList<>();
            ArrayList<String> v_values = new ArrayList<>();
            while (rs.next()) {

                labels.add(rs.getString(1));
                c_values.add(rs.getString(3));
                d_values.add(rs.getString(4));
                v_values.add(rs.getString(5));

            }
            c.close();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("graphs.jsp");
            request.setAttribute("labels", Arrays.toString(labels.toArray())
            );
            request.setAttribute("cases", Arrays.toString(c_values.toArray()));
            request.setAttribute("deaths", Arrays.toString(d_values.toArray()));
            request.setAttribute("vacc", Arrays.toString(v_values.toArray()));
        requestDispatcher.forward(request, response);
        } catch (Exception e) {
            dbUtil.ERROR = e.getLocalizedMessage();
            response.sendRedirect("./err");
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
