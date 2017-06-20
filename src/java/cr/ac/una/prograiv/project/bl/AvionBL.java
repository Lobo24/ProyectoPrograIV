/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;
import cr.ac.una.prograiv.project.domain.Aerolinea;
import cr.ac.una.prograiv.project.domain.Avion;
import cr.ac.una.prograiv.project.domain.Pais;
import cr.ac.una.prograiv.project.domain.Ruta;
import cr.ac.una.prograiv.project.domain.TipoAvion;
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
            Ruta r= (Ruta)this.getDao(Ruta.class.getName()).findById(aux.getRuta());
            r.setPaisOrigen((Pais)getDao(Pais.class.getName()).findById(r.getOrigen()));
            r.setPaisDestino((Pais)getDao(Pais.class.getName()).findById(r.getDestino()));
            aux.setRutao(r);
            aux.setTipoAviono((TipoAvion)this.getDao(TipoAvion.class.getName()).findById(aux.getTipoAvion()));
            aux.setAerolineao((Aerolinea)this.getDao(Aerolinea.class.getName()).findById(aux.getAerolinea()));
        });
        return aviones;
    }

    @Override
    public Avion findByWord(String o) {
        return null;
    }
    
    public boolean existe(Avion av){
        List<Avion> aviones = findAll(Avion.class.getName());
        return aviones.stream().anyMatch((aux) -> (aux.getRuta()==av.getRuta() && aux.getHorarioSalida().equals(av.getHorarioSalida())));
    }

    @Override
    public List createQueryHQL(String className, String query) {
         List<Avion> aviones = this.getDao(Avion.class.getName()).createQueryHQL(query);
        aviones.forEach((aux) -> {
            Ruta r= (Ruta)this.getDao(Ruta.class.getName()).findById(aux.getRuta());
            r.setPaisOrigen((Pais)getDao(Pais.class.getName()).findById(r.getOrigen()));
            r.setPaisDestino((Pais)getDao(Pais.class.getName()).findById(r.getDestino()));
            aux.setRutao(r);
            aux.setTipoAviono((TipoAvion)this.getDao(TipoAvion.class.getName()).findById(aux.getTipoAvion()));
            aux.setAerolineao((Aerolinea)this.getDao(Aerolinea.class.getName()).findById(aux.getAerolinea()));
        });
        return aviones;
    }
      
    public String query(String fecha,String origen,String destino){
        String query = "select a.* from avion a,(select id_ruta from ruta "
                + "where origen like '"+origen+"%' "
                + "and destino like '"+destino+"%')t1 where "
                + "a.id_ruta=t1.id_ruta and horario_salida like '" + fecha + "%'";
        return query;
    }
}
