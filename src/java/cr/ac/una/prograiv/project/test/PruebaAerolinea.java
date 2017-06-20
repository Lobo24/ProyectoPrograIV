/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.test;

import cr.ac.una.prograiv.project.bl.AerolineaBL;
import cr.ac.una.prograiv.project.domain.Aerolinea;
import java.util.Date;

/**
 *
 * @author lobo
 */
public class PruebaAerolinea implements TestBD{

    public static void main(String []args){
        new PruebaAerolinea().testSave();
    }
    
    
    @Override
    public void testSave() {
        Aerolinea ae1=new Aerolinea("Mexicana",146);
        AerolineaBL bl= new AerolineaBL();
        bl.save(ae1);
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
