/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.project.bl.PaisBL;
import cr.ac.una.prograiv.project.bl.RutaBL;
import cr.ac.una.prograiv.project.domain.Ruta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lobo
 */
public class RutaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.InterruptedException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String json;
            Ruta ruta = new Ruta();
            RutaBL rBL = new RutaBL();
            HttpSession session = request.getSession();
            
            Thread.sleep(1000);
            
            String accion = request.getParameter("accion");
            switch(accion){
                case "consultarRutas":
                    json = new Gson().toJson(rBL.findAll(Ruta.class.getName()));
                    out.print(json);
                    break;
                case "buscarRuta":
                    json = new Gson().toJson(rBL.findById(Integer.parseInt(request.getParameter("idRuta"))));
                    out.print(json);
                    break;
                case "registroRutas": case "modificarRuta":
                    ruta.setOrigen(Integer.parseInt(request.getParameter("origen")));
                    ruta.setDestino(Integer.parseInt(request.getParameter("destino")));
                    ruta.setMinutos(Integer.valueOf(request.getParameter("minutos")));
                    ruta.setDescuento(Float.valueOf(request.getParameter("descuento")));
                    ruta.setTarifa(Float.valueOf(request.getParameter("tarifa")));
                    ruta.setUltimoUsuario((String)session.getAttribute("nombreUsuario"));
                    ruta.setUltimaFecha(new Date());
                    if(accion.equals("registroRutas")){
                        rBL.save(ruta);
                        out.print("C~La ruta se ingreso correctamente ");
                    }else{
                        ruta.setIdRuta(Integer.parseInt(request.getParameter("idRuta")));
                        rBL.merge(ruta);
                        out.print("C~La ruta se modifico correctamente ");
                    }
                    
                    break;
                case "consultarPais": 
                    break;
                case "eliminarRuta":
                        ruta.setIdRuta(Integer.parseInt(request.getParameter("idRuta")));
                        rBL.delete(ruta);
                        out.print("La ruta fue eliminada correctamente");
                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizare");
                    break;                 
            }
        } catch (NumberFormatException e) {
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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(RutaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(RutaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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