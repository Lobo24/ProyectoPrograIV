/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;
import cr.ac.una.prograiv.project.domain.Usuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author chgari
 */
public class UsuarioBL extends BaseBL implements IBaseBL<Usuario, Integer>{
    public UsuarioBL() {
        super();
    }
    @Override
    public void save(Usuario o) {
        if(findByNombreUsuario(o.getNombreUsuario())==null){
            this.getDao(o.getClass().getName()).save(o);
        }
        else{
            System.out.println("Ya existe");
        }
    }
    
    
    @Override
    public Usuario merge(Usuario o) {
        return (Usuario) this.getDao(o.getClass().getName()).merge(o);
    }
    @Override
    public void delete(Usuario o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
        */
        this.getDao(o.getClass().getName()).delete(o);
    }
    @Override
    public Usuario findById(Integer o) {
        return (Usuario) this.getDao(Usuario.class.getName()).findById(o);
    }
    
    
    @Override
    public List<Usuario> findAll(String o) {
        return this.getDao(o).findAll();
    }
    
    public Usuario findByNombreUsuario(String name){
        List<Usuario> usuarios = findAll(Usuario.class.getName());
        for (Usuario aux: usuarios) {
            if(aux.getNombreUsuario().equals(name)){
                return aux;
            }
        }
        return null;
    }
    
    @Override
    public Usuario findByWord(String o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
