/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.controller;

import com.google.gson.Gson;
import cr.ac.una.prograiv.project.bl.AvionBL;
import cr.ac.una.prograiv.project.domain.Avion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class AvionServlet extends HttpServlet {

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
            Avion avion = new Avion();
            AvionBL uBL = new AvionBL();
            HttpSession session = request.getSession();
            Thread.sleep(1000);
            String accion = request.getParameter("accion");
            switch (accion) {
                case "consultarAviones":
                    json = new Gson().toJson(uBL.findAll(Avion.class.getName()));
                    out.print(json);
                    break;
                case "registroAvion":
                    avion.setAerolinea(Integer.parseInt(request.getParameter("aerolinea")));
                    avion.setRuta(Integer.parseInt(request.getParameter("ruta")));
                    avion.setTipoAvion(Integer.parseInt(request.getParameter("tipoAvion")));
                    String fechatxt = request.getParameter("salida");
                    DateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm", Locale.ENGLISH);
                    Date date = format.parse(fechatxt);
                    avion.setHorarioSalida(date);
                    fechatxt = request.getParameter("llegada");
                    format = new SimpleDateFormat("dd-MM-yyyy hh:mm", Locale.ENGLISH);
                    date = format.parse(fechatxt);
                    avion.setHorarioLlegada(date);
                    uBL.save(avion);
                    avion.setUltimoUsuario((String)session.getAttribute("nombreUsuario"));
                    avion.setUltimaFecha(new Date());
                    out.print("C~Se registro correctamente");
                    break;
                case "buscarVuelos":
                    String fecha,ori,des;
                    ori=request.getParameter("origenSearch");
                    des=request.getParameter("destinoSearch");
                    fecha = request.getParameter("salidaSearch");
                    DateFormat df = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
                    Date d = df.parse(fecha);
                    df=new SimpleDateFormat("yyyy-MM-dd");
                    fecha=df.format(d);
                    json = new Gson().toJson( uBL.createQueryHQL(
                            Avion.class.getName(),uBL.query(fecha, ori, des)));
                    out.print(json);
                    break;
                default:
                    out.print("E~No se indico la acción que se desea realizar");
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
