/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.project.bl.AerolineaBL;
import cr.ac.una.prograiv.project.domain.Aerolinea;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lobo
 */
public class AerolineaServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            String json;
            Aerolinea aerolinea = new Aerolinea();
            AerolineaBL uBL = new AerolineaBL();
            HttpSession session = request.getSession();
            Thread.sleep(1000);
            String accion = request.getParameter("accion");
            switch(accion){
                case "consultarAerolineas":
                    json = new Gson().toJson(uBL.findAll(Aerolinea.class.getName()));
                    out.print(json);
                    break;
                case "buscarAerolinea":
                    json = new Gson().toJson(uBL.findById(Integer.parseInt(request.getParameter("idAerolinea"))));
                    out.print(json);
                    break;
                case "eliminarAerolinea":
                        aerolinea.setPkIdAerolinea(Integer.parseInt(request.getParameter("idAerolinea")));
                        uBL.delete(aerolinea);
                        out.print("La aerolinea fue eliminada correctamente");
                    break;
                case "registroAerolinea": case "modificarAerolinea":
                    aerolinea.setNombre(request.getParameter("nombre"));
                    aerolinea.setIdPais(Integer.parseInt(request.getParameter("pais")));
                    aerolinea.setUltimoUsuario((String)session.getAttribute("nombreUsuario"));
                    aerolinea.setUltimaFecha(new Date());
                    if(accion.equals("registroAerolinea")){
                    uBL.save(aerolinea);
                    out.print("C~La aerolinea se guardo correctamente");
                    }else{
                        aerolinea.setPkIdAerolinea(Integer.parseInt(request.getParameter("idAerolinea")));
                        uBL.merge(aerolinea);
                        out.print("C~La aerolinea se modificó correctamente");
                    }
                    break;
                    
                default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;                 
            }
        } catch (NumberFormatException e) {
            out.print("E~" + e.getMessage());
        } catch (Exception e) {
            out.print("E~" + e.getMessage());
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
