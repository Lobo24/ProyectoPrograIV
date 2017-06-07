/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;

import cr.ac.una.prograiv.project.domain.Aerolinea;
import cr.ac.una.prograiv.project.domain.Pais;
import cr.ac.una.prograiv.project.domain.Ruta;
import java.util.List;

/**
 *
 * @author chgari
 */
public class RutaBL extends BaseBL implements IBaseBL<Ruta, Integer> {

    public RutaBL() {
        super();
    }

    @Override
    public void save(Ruta o) {
        if (this.findByOrigenDestino(o.getOrigen(), o.getDestino()) == null) {
            this.getDao(o.getClass().getName()).save(o);
        } else {
            System.out.println("Error el Ruta no existe");
        }
    }

    @Override
    public Ruta merge(Ruta o) {
        return (Ruta) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Ruta o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
         */
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Ruta findById(Integer o) {
        return (Ruta) this.getDao(Ruta.class.getName()).findById(o);
    }

    @Override
    public List<Ruta> findAll(String className) {
         List<Ruta> rutas = this.getDao(className).findAll();
        rutas.forEach((aux) -> {
            aux.setPaisOrigen((Pais)this.getDao(Pais.class.getName()).findById(aux.getOrigen()));
            aux.setPaisDestino((Pais)this.getDao(Pais.class.getName()).findById(aux.getDestino()));
        });
        return rutas;
    }

    @Override
    public Ruta findByWord(String o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Ruta findByOrigenDestino(int origen, int destino) {
        List<Ruta> rutas = findAll(Ruta.class.getName());
        for (Ruta aux : rutas) {
            if (aux.getOrigen() == origen && aux.getDestino() == destino) {
                return aux;
            }
        }
        return null;
    }
}
