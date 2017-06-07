/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;

import cr.ac.una.prograiv.project.domain.Pais;
import java.util.List;

/**
 *
 * @author lobo
 */
public class PaisBL extends BaseBL implements IBaseBL<Pais, Integer> {

    public PaisBL() {
        super();
    }

    @Override
    public void save(Pais o) {
            this.getDao(o.getClass().getName()).save(o);
    }

    @Override
    public Pais merge(Pais o) {
        return (Pais) this.getDao(o.getClass().getName()).merge(o);
    }

    @Override
    public void delete(Pais o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
         */
        this.getDao(o.getClass().getName()).delete(o);
    }

    @Override
    public Pais findById(Integer o) {
        return (Pais) this.getDao(Pais.class.getName()).findById(o);
    }

    @Override
    public List<Pais> findAll(String className) {
        return this.getDao(className).findAll();
    }

    @Override
    public Pais findByWord(String o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}