/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.test;

import cr.ac.una.prograiv.project.bl.TipoAvionBL;
import cr.ac.una.prograiv.project.domain.TipoAvion;
import java.util.List;

/**
 *
 * @author lobo
 */
public class PruebaTipoAviones {

    public static void main(String[] args) {
//            testFindByWord("cristian031");
            testSave();
//        testMerge();
//        testDelete();
//        testFindbyID(2);
        testFindAll();
    }

    public static void testSave() {
//        TipoAvion u2 = new TipoAvion("0000","bperez2210","Bryan","Perez","sdfdsfs","Lobo",new Date(),true);
        TipoAvion u2 = new TipoAvion("Tu-204", "Túpolev",1994, 36, 6);
//        TipoAvionDAO pDao = new TipoAvionDAO();
        TipoAvionBL pDao = new TipoAvionBL();
//        uBL.save(u2);
        pDao.save(u2);
    }

    public static void testMerge() {
//        TipoAvion u1 = new TipoAvion("1234", "cristian031", "Cristian", "Garita", "Nose", "admin", new Date(), false);
//        TipoAvionDAO pDao = new TipoAvionDAO();
//        u1.setNumTel("546841313");
//        pDao.merge(u1);
    }

    public static void testDelete() {
//        TipoAvion u1 = new TipoAvion("1234", "cristian031", "Cristian", "Garita", "Nose", "admin", new Date(), false);
//        TipoAvionDAO pDao = new TipoAvionDAO();
//        pDao.save(u1);
    }

    public static void testFindbyID(int id) {
//        TipoAvionDAO pDao = new TipoAvionDAO();
//        TipoAvion d1 = pDao.findById(id);
//        System.out.println(d1.getNombreTipoAvion());
    }

    public static void testFindByWord(String word) {
//        TipoAvionDAO pDao = new TipoAvionDAO();
//        TipoAvion d1 = pDao.findByWord(word);
//        System.out.println(d1.getPkIdTipoAvion());
    }

    public static void testFindAll() {
        TipoAvionBL ubl = new TipoAvionBL();
        List<TipoAvion> listaTipoAvion;
        listaTipoAvion = ubl.findAll(TipoAvion.class.getName());
        System.out.println(listaTipoAvion.size());

//        TipoAvionDAO pDao = new TipoAvionDAO();
//        listaTipoAvion = pDao.findAll();
    }

}
