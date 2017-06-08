/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.domain;

/**
 *
 * @author lobo
 */
public class Asiento {
    private String idAsiento;
    private int idAvion;
    private boolean estado;

    public Asiento(){
        
    }
    public Asiento(String idAsiento, int idAvion, boolean estado) {
        this.idAsiento = idAsiento;
        this.idAvion = idAvion;
        this.estado = estado;
    }

    public String getIdAsiento() {
        return idAsiento;
    }

    public void setIdAsiento(String idAsiento) {
        this.idAsiento = idAsiento;
    }

    public int getIdAvion() {
        return idAvion;
    }

    public void setIdAvion(int idAvion) {
        this.idAvion = idAvion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
}
