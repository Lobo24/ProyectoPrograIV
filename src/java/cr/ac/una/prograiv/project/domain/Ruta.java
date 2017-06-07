package cr.ac.una.prograiv.project.domain;
// Generated 31/05/2017 07:47:08 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Ruta generated by hbm2java
 */
public class Ruta  implements java.io.Serializable {


     private Integer idRuta;
     private int origen;
     private int destino;
     private int minutos;
     private float descuento;
     private String ultimoUsuario;
     private Date ultimaFecha;
     private Pais paisOrigen;
     private Pais paisDestino;

    public Ruta() {
    }

	
    public Ruta(int origen, int destino, int minutos) {
        this.origen = origen;
        this.destino = destino;
        this.minutos = minutos;
        this.descuento = 0;
        this.paisOrigen=null;
        this.paisDestino=null;
    }
    public Ruta(int origen, int destino, int minutos, float descuento, String ultimoUsuario, Date ultimaFecha) {
       this.origen = origen;
       this.destino = destino;
       this.minutos = minutos;
       this.descuento = descuento;
       this.ultimoUsuario = ultimoUsuario;
       this.ultimaFecha = ultimaFecha;
       this.paisOrigen=null;
       this.paisDestino=null;
    }

    public Pais getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(Pais pais) {
        this.paisOrigen = pais;
    }
    public Pais getPaisDestino() {
        return paisDestino;
    }

    public void setPaisDestino(Pais pais) {
        this.paisDestino = pais;
    }
    public Integer getIdRuta() {
        return this.idRuta;
    }
    
    public void setIdRuta(Integer idRuta) {
        this.idRuta = idRuta;
    }
    public int getOrigen() {
        return this.origen;
    }
    
    public void setOrigen(int origen) {
        this.origen = origen;
    }
    public int getDestino() {
        return this.destino;
    }
    
    public void setDestino(int destino) {
        this.destino = destino;
    }
    public int getMinutos() {
        return this.minutos;
    }
    
    public void setMinutos(int minutos) {
        this.minutos = minutos;
    }
    public float getDescuento() {
        return this.descuento;
    }
    
    public void setDescuento(float descuento) {
        this.descuento = descuento;
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


