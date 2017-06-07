/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.Boleto;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author admin
 */
public class BoletoDAO extends HibernateUtil implements IBaseDAO< Boleto,Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(Boleto o) {
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
    public Boleto merge(Boleto o){
        try{
        iniciarOperacion();
        o = (Boleto) getSesion().merge(o);
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
    public void delete(Boleto o) {
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
    public Boleto findById(Integer key) {
        Boleto boletos = null;
        try{
        iniciarOperacion();
        boletos = (Boleto) getSesion().get(Boleto.class,key);
        }finally{
            getSesion().close();
        }
        return boletos;
    }

    @Override
    public List<Boleto> findAll() {
        List<Boleto> listaBoleto;
        try{
        iniciarOperacion();
        listaBoleto = getSesion().createQuery("from Boleto").list();
        }finally{
            getSesion().close();
        }
        return listaBoleto;
    }

    @Override
    public Boleto findByWord(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
