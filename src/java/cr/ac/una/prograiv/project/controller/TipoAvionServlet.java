/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.project.bl.TipoAvionBL;
import cr.ac.una.prograiv.project.domain.TipoAvion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lobo
 */
public class TipoAvionServlet extends HttpServlet {

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
            TipoAvionBL uBL = new TipoAvionBL();
            TipoAvion tipo = new TipoAvion();
            HttpSession session = request.getSession();
            
            Thread.sleep(1000);
            
            String accion = request.getParameter("accion");
            switch(accion){
                case "consultarTipoAvion":
                    json = new Gson().toJson(uBL.findAll(TipoAvion.class.getName()));
                    out.print(json);
                    break;
                case "buscarTipoAvion":
                    json = new Gson().toJson(uBL.findById(Integer.parseInt(request.getParameter("idTipoAvion"))));
                    out.print(json);
                    break;
                case "eliminarTipoAvion":
                        tipo.setIdTipo(Integer.parseInt(request.getParameter("idTipoAvion")));
                        uBL.delete(tipo);
                        out.print("El tipo de avion fue eliminado correctamente");
                    break;
                case "registroTipoAvion": case "modificarTipoAvion":
                    tipo.setMarca(request.getParameter("marca"));
                    tipo.setModelo(request.getParameter("modelo"));
                    tipo.setAño(Integer.valueOf(request.getParameter("año")));
                    tipo.setCantAsientosPorFila(Integer.valueOf(request.getParameter("asientosPorFila")));
                    tipo.setCantPasajeros(Integer.valueOf(request.getParameter("pasajeros")));
                    tipo.setCantFila(Integer.valueOf(request.getParameter("filas")));
                    if(accion.equals("registroTipoAvion")){
                    uBL.save(tipo);
                    out.print("C~El tipo de avión se guardó correctamente");
                    }else{
                        tipo.setIdTipo(Integer.parseInt(request.getParameter("idTipo")));
                        uBL.merge(tipo);
                        out.print("C~El tipo de vión se modificó correctamente");
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
