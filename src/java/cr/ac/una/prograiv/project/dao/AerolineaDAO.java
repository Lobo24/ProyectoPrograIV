/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.Aerolinea;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author admin
 */
public class AerolineaDAO extends HibernateUtil implements IBaseDAO<Aerolinea,Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(Aerolinea o) {
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
    public Aerolinea merge(Aerolinea o){
        try{
        iniciarOperacion();
        o = (Aerolinea) getSesion().merge(o);
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
    public void delete(Aerolinea o) {
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
    public Aerolinea findById(Integer key) {
        Aerolinea aerolineas = null;
        try{
        iniciarOperacion();
        aerolineas = (Aerolinea) getSesion().get(Aerolinea.class,key);
        }finally{
            getSesion().close();
        }
        return aerolineas;
    }

    @Override
    public List<Aerolinea> findAll() {
        List<Aerolinea> listaAerolinea;
        try{
        iniciarOperacion();
        listaAerolinea = getSesion().createQuery("from Aerolinea").list();
        }finally{
            getSesion().close();
        }
        return listaAerolinea;
    }

    @Override
    public Aerolinea findByWord(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
