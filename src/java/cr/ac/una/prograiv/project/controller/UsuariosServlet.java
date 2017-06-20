/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.controller;

import cr.ac.una.prograiv.project.bl.UsuarioBL;
import cr.ac.una.prograiv.project.domain.Usuario;
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
import com.google.gson.Gson;
/**
 *
 * @author admin
 */
public class UsuariosServlet extends HttpServlet {

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
            Usuario usuario = new Usuario();
            UsuarioBL uBL = new UsuarioBL();
            HttpSession session = request.getSession();
            Thread.sleep(1000);
            String accion = request.getParameter("accion");
            switch(accion){
                case "consultarUsuarios":
                    json = new Gson().toJson(uBL.findAll(Usuario.class.getName()));
                    out.print(json);
                    break;
                case "buscarUsuario":
                    json = new Gson().toJson(uBL.findById(Integer.parseInt(request.getParameter("idUsuario"))));
                    out.print(json);
                    break;
                case "eliminarUsuario":
                        usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
                        uBL.delete(usuario);
                        out.print("El usuario fue eliminado correctamente");
                    break;
                case "registroAdmin": case "modificarUsuario" :
                    usuario.setContrasena(request.getParameter("contrasena"));
                    usuario.setNombreUsuario(request.getParameter("nombreUsuario"));
                    usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
                    usuario.setDireccion(request.getParameter("direccion"));
                    usuario.setNombre(request.getParameter("nombre"));
                    usuario.setApellido1(request.getParameter("apellido1"));
                    usuario.setApellido2(request.getParameter("apellido2"));
                    
                    String fechatxt = request.getParameter("fechaNacimiento");
                    DateFormat format = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
                    Date date = format.parse(fechatxt);
                    
                    usuario.setFechaNacimiento(date);
                    usuario.setEmail(request.getParameter("correo"));
                    usuario.setAdmin(true);
                    usuario.setNumTel(request.getParameter("telefono"));
                    if(accion.equals("registroAdmin")){
                        uBL.save(usuario);
                        out.print("El Administrador fue agregado correctamente");
                    }else{
                        uBL.merge(usuario);
                        out.print("El usuario fue modificado correctamente");
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
