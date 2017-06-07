/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;
import cr.ac.una.prograiv.project.domain.TipoAvion;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author chgari
 */
public class TipoAvionBL extends BaseBL implements IBaseBL<TipoAvion, Integer>{
    public TipoAvionBL() {
        super();
    }
    @Override
    public void save(TipoAvion o) {
        if(this.findMarcaModeloAño(o.getMarca(), o.getModelo(),o.getAño())==null){
            this.getDao(o.getClass().getName()).save(o);
        }else{
            System.out.println("Error el Aerolinea ya existe");
        }
    }
    
    @Override
    public TipoAvion merge(TipoAvion o) {
        return (TipoAvion) this.getDao(o.getClass().getName()).merge(o);
    }
    @Override
    public void delete(TipoAvion o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
        */
        this.getDao(o.getClass().getName()).delete(o);
    }
    @Override
    public TipoAvion findById(Integer o) {
        return (TipoAvion) this.getDao(TipoAvion.class.getName()).findById(o);
    }
    @Override
    public List<TipoAvion> findAll(String className) {
        return this.getDao(className).findAll();
    }

    @Override
    public TipoAvion findByWord(String o) {
        return (TipoAvion) this.getDao(TipoAvion.class.getName()).findByWord(o);
    }
    
    public TipoAvion findMarcaModeloAño(String marca, String modelo, int año){
        List<TipoAvion> tipos=findAll(TipoAvion.class.getName());
        for(TipoAvion aux:tipos){
            if(aux.getAño()==año && aux.getMarca().equals(marca) && aux.getModelo().equals(modelo))
                return aux;
        }
        return null;
    }

    @Override
    public List createQueryHQL(String className, LinkedHashMap<String, Object> parametros) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
