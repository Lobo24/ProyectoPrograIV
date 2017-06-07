/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.Pais;
import cr.ac.una.prograiv.project.domain.Ruta;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author admin
 */
public class RutaDAO extends HibernateUtil implements IBaseDAO<Ruta,Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(Ruta o) {
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
    public Ruta merge(Ruta o){
        try{
        iniciarOperacion();
        o = (Ruta) getSesion().merge(o);
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
    public void delete(Ruta o) {
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
    public Ruta findById(Integer key) {
        Ruta rutas = null;
        try{
        iniciarOperacion();
        rutas = (Ruta) getSesion().get(Ruta.class,key);
        }finally{
            getSesion().close();
        }
        return rutas;
    }

    @Override
    public List<Ruta> findAll() {
        List<Ruta> listaRuta;
        try{
        iniciarOperacion();
        listaRuta = getSesion().createQuery("from Ruta").list();
        }finally{
            getSesion().close();
        }
        return listaRuta;
    }

    @Override
    public Ruta findByWord(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
