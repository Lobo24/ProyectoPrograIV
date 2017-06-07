/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.dao;

import cr.ac.una.prograiv.project.domain.Usuario;
import cr.ac.una.prograiv.project.utils.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;

/**
 *
 * @author admin
 */
public class UsuarioDAO extends HibernateUtil implements IBaseDAO<Usuario,Integer>{ // cuidado ver en el dominio el tipo de la llave primaria de la tabla por eso Integer

    @Override
    public void save(Usuario o) {
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
    public Usuario merge(Usuario o){
        try{
        iniciarOperacion();
        o = (Usuario) getSesion().merge(o);
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
    public void delete(Usuario o) {
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
    public Usuario findById(Integer key) {
        Usuario usuarios = null;
        try{
        iniciarOperacion();
        usuarios = (Usuario) getSesion().get(Usuario.class,key);
        }finally{
            getSesion().close();
        }
        return usuarios;
    }
    
    @Override
    public List<Usuario> findAll() {
        List<Usuario> listaUsuario;
        try{
        iniciarOperacion();
        listaUsuario = getSesion().createQuery("from Usuario").list();
        }finally{
            getSesion().close();
        }
        return listaUsuario;
    }

    @Override
    public Usuario findByWord(String key) {
        Usuario usuarios = null;
        List<Usuario> listaUsuario;
        try{
        iniciarOperacion();
        listaUsuario = getSesion().createQuery("from Usuario where nombreUsuario = '" + key + "'").list();
        if(listaUsuario != null){
            usuarios=listaUsuario.get(0);
        }
        }finally{
            getSesion().close();
        }
        return usuarios;    
    }
}
