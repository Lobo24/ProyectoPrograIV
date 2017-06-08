package cr.ac.una.prograiv.project.domain;
// Generated 31/05/2017 07:47:08 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private int idUsuario;
     private String contrasena;
     private String nombreUsuario;
     private String direccion;
     private String nombre;
     private String apellido1;
     private String apellido2;
     private Date fechaNacimiento;
     private String email;
     private String numTel;
     private String numCel;
     private boolean admin;
     private String ultimoUsuario;
     private Date ultimaFecha;

    public Usuario() {
    }

	
    public Usuario(int idUsuario, String contrasena, String nombreUsuario, String direccion, String nombre, String apellido1, String apellido2, Date fechaNacimiento, String email, String numTel, boolean admin) {
        this.idUsuario = idUsuario;
        this.contrasena = contrasena;
        this.nombreUsuario = nombreUsuario;
        this.direccion = direccion;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.fechaNacimiento = fechaNacimiento;
        this.email = email;
        this.numTel = numTel;
        this.admin = admin;
    }
    public Usuario(int idUsuario, String contrasena, String nombreUsuario, String direccion, String nombre, String apellido1, String apellido2, Date fechaNacimiento, String email, String numTel, String numCel, boolean admin, String ultimoUsuario, Date ultimaFecha) {
       this.idUsuario = idUsuario;
       this.contrasena = contrasena;
       this.nombreUsuario = nombreUsuario;
       this.direccion = direccion;
       this.nombre = nombre;
       this.apellido1 = apellido1;
       this.apellido2 = apellido2;
       this.fechaNacimiento = fechaNacimiento;
       this.email = email;
       this.numTel = numTel;
       this.numCel = numCel;
       this.admin = admin;
       this.ultimoUsuario = ultimoUsuario;
       this.ultimaFecha = ultimaFecha;
    }
   
    public int getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public String getContrasena() {
        return this.contrasena;
    }
    
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public String getNombreUsuario() {
        return this.nombreUsuario;
    }
    
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido1() {
        return this.apellido1;
    }
    
    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }
    public String getApellido2() {
        return this.apellido2;
    }
    
    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }
    public Date getFechaNacimiento() {
        return this.fechaNacimiento;
    }
    
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getNumTel() {
        return this.numTel;
    }
    
    public void setNumTel(String numTel) {
        this.numTel = numTel;
    }
    public String getNumCel() {
        return this.numCel;
    }
    
    public void setNumCel(String numCel) {
        this.numCel = numCel;
    }
    public boolean isAdmin() {
        return this.admin;
    }
    
    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
    public String getUltimoUsuario() {
        return this.ultimoUsuario;
    }
    
    public void setUltimoUsuario(String ultimoUsuario) {
        this.ultimoUsuario = ultimoUsuario;
    }
    public Date getUltimaFecha() {
        return this.ultimaFecha;
    }
    
    public void setUltimaFecha(Date ultimaFecha) {
        this.ultimaFecha = ultimaFecha;
    }
}
