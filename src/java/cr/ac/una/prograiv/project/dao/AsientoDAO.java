/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.Asiento;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author admin
 */
public class AsientoDAO extends HibernateUtil implements IBaseDAO<Asiento,Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(Asiento o) {
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
    public Asiento merge(Asiento o){
        try{
        iniciarOperacion();
        o = (Asiento) getSesion().merge(o);
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
    public void delete(Asiento o) {
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
    public Asiento findById(Integer key) {
        Asiento aerolineas = null;
        try{
        iniciarOperacion();
        aerolineas = (Asiento) getSesion().get(Asiento.class,key);
        }finally{
            getSesion().close();
        }
        return aerolineas;
    }

    @Override
    public List<Asiento> findAll() {
        List<Asiento> listaAsiento;
        try{
        iniciarOperacion();
        listaAsiento = getSesion().createQuery("from Asiento").list();
        }finally{
            getSesion().close();
        }
        return listaAsiento;
    }

    @Override
    public Asiento findByWord(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List createQueryHQL(LinkedHashMap<String, Object> parametros) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
