/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.test;

import cr.ac.una.prograiv.project.bl.UsuarioBL;
import cr.ac.una.prograiv.project.domain.Usuario;
import java.util.Date;

/**
 *
 * @author admin
 */
public class PruebaUsuarios {
        public static void main(String []args){
//            testFindByWord("cristian031");
          testSave();
//        testMerge();
//        testDelete();
//        testFindbyID(2);
//        testFindAll();
    }
    
    public static void testSave(){
       Usuario u2 = new Usuario(000000000,"admin","admin","unknown","unknown","unknown","unknown",new Date(),"10-07-1997","84835609",true);
//      Usuario u2 = new Usuario(115860285,"admin","admin","Heredia","Oscar","Carmona","Mora",new Date(),"10-07-1997","84835609",true);
//        UsuarioDAO pDao = new UsuarioDAO();
        UsuarioBL pDao = new UsuarioBL();
//        uBL.save(u2);
        pDao.save(u2);
    }
}
    
//    public static void testMerge(){
//         Usuario u1 = new Usuario(000000,"1234","cristian031","Cristian","Garita", "Nose", "admin",false, "Costa Rica");
//        UsuarioDAO pDao = new UsuarioDAO();
//        u1.setNumTel("546841313");
//        pDao.merge(u1);
//    }
//    
//    public static void testDelete(){
//        Usuario u1 = new Usuario(000000,"1234","cristian031","Cristian","Garita", "Nose", "admin",false,"Costa Rica");
//        UsuarioDAO pDao = new UsuarioDAO();
//        pDao.save(u1);
//    }
    
//    public static void testFindbyID(int id){
//        UsuarioDAO pDao = new UsuarioDAO();
//        Usuario d1 = pDao.findById(id);
//        System.out.println(d1.getNombreUsuario());
//    }
//    
//    public static void testFindByWord(String word){
//        UsuarioDAO pDao = new UsuarioDAO();
//        Usuario d1 = pDao.findByWord(word);
//        System.out.println(d1.getIdUsuario());
//    }
//    
//    public static void testFindAll(){
//        UsuarioBL ubl=new UsuarioBL();
//        List<Usuario> listaUsuario;
//        listaUsuario = ubl.findAll(Usuario.class.getName());
//        System.out.println(listaUsuario.size());
//        
//
////        UsuarioDAO pDao = new UsuarioDAO();
////        listaUsuario = pDao.findAll();
//
//    }
//    
//}
