/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;
import cr.ac.una.prograiv.project.domain.Aerolinea;
import cr.ac.una.prograiv.project.domain.Pais;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author chgari
 */
public class AerolineaBL extends BaseBL implements IBaseBL<Aerolinea, Integer>{
    public AerolineaBL() {
        super();
    }
    @Override
    public void save(Aerolinea o) {
        if(this.findByWord(o.getNombre())==null){
            this.getDao(o.getClass().getName()).save(o);
        }else{
            System.out.println("Error el Aerolinea ya existe");
        }
    }
    
    @Override
    public Aerolinea merge(Aerolinea o) {
        return (Aerolinea) this.getDao(o.getClass().getName()).merge(o);
    }
    @Override
    public void delete(Aerolinea o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
        */
        this.getDao(o.getClass().getName()).delete(o);
    }
    @Override
    public Aerolinea findById(Integer o) {
        return (Aerolinea) this.getDao(Aerolinea.class.getName()).findById(o);
    }
    @Override
    public List<Aerolinea> findAll(String className) {
        List<Aerolinea> aerolineas = this.getDao(className).findAll();
        aerolineas.forEach((aux) -> {
            aux.setPais((Pais)this.getDao(Pais.class.getName()).findById(aux.getIdPais()));
        });
        return aerolineas;
    }
    
    @Override
    public Aerolinea findByWord(String o) {
         List<Aerolinea> aerolineas = findAll(Aerolinea.class.getName());
        for (Aerolinea aux: aerolineas) {
            if(aux.getNombre().equals(o)){
                return aux;
            }
        }
        return null;
    }

    @Override
    public List createQueryHQL(String className, LinkedHashMap<String, Object> parametros) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
