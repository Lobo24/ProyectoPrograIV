/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.test;

import cr.ac.una.prograiv.project.bl.AerolineaBL;
import cr.ac.una.prograiv.project.bl.AvionBL;
import cr.ac.una.prograiv.project.dao.AvionDAO;
import cr.ac.una.prograiv.project.domain.Aerolinea;
import cr.ac.una.prograiv.project.domain.Avion;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author lobo
 */
public class PruebaAvion implements TestBD {

    public static void main(String[] args) throws ParseException {
        //AvionDAO a=new AvionDAO();
        //a.findAll();
        String fechatxt = "21-06-2017";
        DateFormat format = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
        Date date = format.parse(fechatxt);
        format=new SimpleDateFormat("yyyy-MM-dd");
        fechatxt=format.format(date);
        System.out.println(fechatxt);
        System.out.println(date.toString());
    }

    @Override
    public void testSave() {
//        Aerolinea ae1=new Aerolinea("Taca", new Date(), "");
//        AerolineaBL bl= new AerolineaBL();
//        bl.save(ae1);
    }

    @Override
    public void testMerge() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void testById() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
