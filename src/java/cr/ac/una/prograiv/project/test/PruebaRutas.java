/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.test;

import cr.ac.una.prograiv.project.bl.RutaBL;
import cr.ac.una.prograiv.project.domain.Pais;
import cr.ac.una.prograiv.project.domain.Ruta;
import java.util.List;

/**
 *
 * @author lobo
 */
public class PruebaRutas {

    public static void main(String[] args) {
//            testFindByWord("cristian031");
            testSave();
//        testMerge();
//        testDelete();
//        testFindbyID(2);
        testFindAll();
    }

    public static void testSave() {
//        Ruta u2 = new Ruta("0000","bperez2210","Bryan","Perez","sdfdsfs","Lobo",new Date(),true);
//        RutaDAO pDao = new RutaDAO();
        RutaBL pDao = new RutaBL();
        Ruta u2=new Ruta(1,100, 200,0);
//        uBL.save(u2);
        pDao.save(u2);
    }

    public static void testMerge() {
//        Ruta u1 = new Ruta("1234", "cristian031", "Cristian", "Garita", "Nose", "admin", new Date(), false);
//        RutaDAO pDao = new RutaDAO();
//        u1.setNumTel("546841313");
//        pDao.merge(u1);
    }

    public static void testDelete() {
//        Ruta u1 = new Ruta("1234", "cristian031", "Cristian", "Garita", "Nose", "admin", new Date(), false);
//        RutaDAO pDao = new RutaDAO();
//        pDao.save(u1);
    }

    public static void testFindbyID(int id) {
//        RutaDAO pDao = new RutaDAO();
//        Ruta d1 = pDao.findById(id);
//        System.out.println(d1.getNombreRuta());
    }

    public static void testFindByWord(String word) {
//        RutaDAO pDao = new RutaDAO();
//        Ruta d1 = pDao.findByWord(word);
//        System.out.println(d1.getPkIdRuta());
    }

    public static void testFindAll() {
        RutaBL ubl = new RutaBL();
        List<Ruta> listaRuta;
        listaRuta = ubl.findAll(Ruta.class.getName());
        System.out.println(listaRuta.size());

//        RutaDAO pDao = new RutaDAO();
//        listaRuta = pDao.findAll();
    }

}
