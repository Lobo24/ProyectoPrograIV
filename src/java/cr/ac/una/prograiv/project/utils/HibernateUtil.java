/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.utils;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author admin
 */
public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    private Session sesion;
    private Transaction transac;
    
    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public void iniciarOperacion()throws HibernateException{
        sesion = HibernateUtil.getSessionFactory().openSession();
        transac = sesion.beginTransaction();
    }
    
    public void manejarExcepcion(HibernateException he) throws HibernateException{
        transac.rollback(); // devolver todo a como estaba antes en caso de que alguna transaccion sea erronea.
        throw new HibernateException("Error Hibernate Utils",he);
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public Session getSesion() {
        return sesion;
    }

    public void setSesion(Session sesion) {
        this.sesion = sesion;
    }

    public Transaction getTransac() {
        return transac;
    }

    public void setTransac(Transaction transac) {
        this.transac = transac;
    }
    
    
}
