/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;
import cr.ac.una.prograiv.project.domain.Avion;
import cr.ac.una.prograiv.project.domain.Pais;
import cr.ac.una.prograiv.project.domain.Ruta;
import cr.ac.una.prograiv.project.domain.TipoAvion;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author chgari
 */
public class AvionBL extends BaseBL implements IBaseBL<Avion, Integer>{
    public AvionBL() {
        super();
    }
    @Override
    public void save(Avion a) {
        if(!existe(a))
            this.getDao(a.getClass().getName()).save(a);

    }
    
    @Override
    public Avion merge(Avion o) {
        return (Avion) this.getDao(o.getClass().getName()).merge(o);
    }
    @Override
    public void delete(Avion o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
        */
        this.getDao(o.getClass().getName()).delete(o);
    }
    @Override
    public Avion findById(Integer o) {
        return (Avion) this.getDao(Avion.class.getName()).findById(o);
    }
    @Override
    public List<Avion> findAll(String className) {
        List<Avion> aviones = this.getDao(className).findAll();
        aviones.forEach((aux) -> {
            aux.setRutao((Ruta)this.getDao(Ruta.class.getName()).findById(aux.getRuta()));
            aux.setTipoAviono((TipoAvion)this.getDao(TipoAvion.class.getName()).findById(aux.getTipoAvion()));
        });
        return aviones;
    }

    @Override
    public Avion findByWord(String o) {
        return null;
    }
    
    public boolean existe(Avion av){
        List<Avion> aviones = findAll(Avion.class.getName());
        return aviones.stream().anyMatch((aux) -> (aux.getRuta()==av.getRuta() && aux.getHorario().equals(av.getHorario())));
    }

    @Override
    public List createQueryHQL(String className, LinkedHashMap<String, Object> parametros) {
        return this.getDao(className).createQueryHQL(parametros);
    }
}
