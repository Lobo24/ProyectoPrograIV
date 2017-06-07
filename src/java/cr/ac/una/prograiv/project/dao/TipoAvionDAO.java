/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.TipoAvion;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author admin
 */
public class TipoAvionDAO extends HibernateUtil implements IBaseDAO<TipoAvion, Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(TipoAvion o) {
        try{
            iniciarOperacion();
            getSesion().save(o);
            getTransac().commit(); // si no se hace commit los cambios no se suben a la base de datos
        }catch(HibernateException he){
            manejarExcepcion(he);
            throw he;
        }finally{
            getSesion().close();
        }
    }

    @Override
    public TipoAvion merge(TipoAvion o){
        try{
        iniciarOperacion();
        o = (TipoAvion) getSesion().merge(o);
        getTransac().commit();
        }catch(HibernateException he){
            manejarExcepcion(he);
            throw he;
        }finally{
            getSesion().close();
        }
        return o;
    }

    @Override
    public void delete(TipoAvion o) {
        try{
        iniciarOperacion();
        getSesion().delete(o);
        getTransac().commit();
        }catch(HibernateException he){
            manejarExcepcion(he);
            throw he;
        }finally{
            getSesion().close();
        }
    }

    @Override
    public TipoAvion findById(Integer key) {
        TipoAvion aerolineas = null;
        try{
        iniciarOperacion();
        aerolineas = (TipoAvion) getSesion().get(TipoAvion.class,key);
        }finally{
            getSesion().close();
        }
        return aerolineas;
    }

    @Override
    public List<TipoAvion> findAll() {
        List<TipoAvion> listaAerolinea;
        try{
        iniciarOperacion();
        listaAerolinea = getSesion().createQuery("from TipoAvion").list();
        }finally{
            getSesion().close();
        }
        return listaAerolinea;
    }

    @Override
    public TipoAvion findByWord(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.        
    }

    @Override
    public List createQueryHQL(LinkedHashMap<String, Object> parametros) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
