/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.project.bl;
import cr.ac.una.prograiv.project.dao.IBaseDAO;
import cr.ac.una.prograiv.project.dao.*;
import java.util.LinkedHashMap;

/**
 *
 * @author admin
 */
public class BaseBL {
    private final LinkedHashMap<String, IBaseDAO> daos;

    public BaseBL() {
        daos = new LinkedHashMap();
        daos.put("cr.ac.una.prograiv.project.domain.Usuario", new UsuarioDAO());
        daos.put("cr.ac.una.prograiv.project.domain.Aerolinea", new AerolineaDAO());
        daos.put("cr.ac.una.prograiv.project.domain.Ruta", new RutaDAO());
        daos.put("cr.ac.una.prograiv.project.domain.TipoAvion", new TipoAvionDAO());
        daos.put("cr.ac.una.prograiv.project.domain.Pais", new PaisDAO());
        daos.put("cr.ac.una.prograiv.project.domain.Avion", new AvionDAO());
    }
    /**
     *
     * @param className
     * @return
     */
    public IBaseDAO getDao(String className){
        return daos.get(className);
    }
}

