/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;

import cr.ac.una.prograiv.project.domain.Asiento;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author lobo
 */
public class AsientoBL extends BaseBL implements IBaseBL<Asiento, Integer>{
    public AsientoBL() {
        super();
    }
    
    @Override
    public void save(Asiento o) {
        if(this.findByWord(o.getIdAsiento())==null){
            this.getDao(o.getClass().getName()).save(o);
        }else{
            System.out.println("Error el Asiento ya existe");
        }
    }
    
    @Override
    public Asiento merge(Asiento o) {
        return (Asiento) this.getDao(o.getClass().getName()).merge(o);
    }
    @Override
    public void delete(Asiento o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
        */
        this.getDao(o.getClass().getName()).delete(o);
    }
    @Override
    public Asiento findById(Integer o) {
        return (Asiento) this.getDao(Asiento.class.getName()).findById(o);
    }
    @Override
    public List<Asiento> findAll(String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public Asiento findByWord(String o) {
         List<Asiento> aerolineas = findAll(Asiento.class.getName());
        for (Asiento aux: aerolineas) {
            if(aux.getIdAsiento().equals(o)){
                return aux;
            }
        }
        return null;
    }

    @Override
    public List createQueryHQL(String className, String query) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}