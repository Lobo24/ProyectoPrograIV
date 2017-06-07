/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.Avion;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author admin
 */
public class AvionDAO extends HibernateUtil implements IBaseDAO<Avion,Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(Avion o) {
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
    public Avion merge(Avion o){
        try{
        iniciarOperacion();
        o = (Avion) getSesion().merge(o);
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
    public void delete(Avion o) {
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
    public Avion findById(Integer key) {
        Avion aviones = null;
        try{
        iniciarOperacion();
        aviones = (Avion) getSesion().get(Avion.class,key);
        }finally{
            getSesion().close();
        }
        return aviones;
    }

    @Override
    public List<Avion> findAll() {
        List<Avion> listaAvion;
        try{
        iniciarOperacion();
        listaAvion = getSesion().createQuery("from Avion").list();
        }finally{
            getSesion().close();
        }
        return listaAvion;
    }

    @Override
    public Avion findByWord(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
