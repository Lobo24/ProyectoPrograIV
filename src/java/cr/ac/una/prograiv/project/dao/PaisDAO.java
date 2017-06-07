/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.Pais;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author lobo
 */
public class PaisDAO extends HibernateUtil implements IBaseDAO<Pais,Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(Pais o) {
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
    public Pais merge(Pais o){
        try{
        iniciarOperacion();
        o = (Pais) getSesion().merge(o);
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
    public void delete(Pais o) {
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
    public Pais findById(Integer key) {
        Pais paises = null;
        try{
        iniciarOperacion();
        paises = (Pais) getSesion().get(Pais.class,key);
        }finally{
            getSesion().close();
        }
        return paises;
    }

    @Override
    public List<Pais> findAll() {
        List<Pais> listaPais;
        try{
        iniciarOperacion();
        listaPais = getSesion().createQuery("from Pais").list();
        }finally{
            getSesion().close();
        }
        return listaPais;
    }

    @Override
    public Pais findByWord(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List createQueryHQL(LinkedHashMap<String, Object> parametros) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}