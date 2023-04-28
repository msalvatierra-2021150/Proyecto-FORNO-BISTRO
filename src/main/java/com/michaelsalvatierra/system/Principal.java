package com.michaelsalvatierra.system;
import com.michaelsalvatierra.models.dao.AlmuerzoDaoImpl;
import com.michaelsalvatierra.models.dao.DesayunosDaoImpl;
import com.michaelsalvatierra.models.dao.PersonaDaoImpl;
import com.michaelsalvatierra.models.dao.PlatilloDaoImpl;
import com.michaelsalvatierra.models.dao.PostreDaoImpl;
import com.michaelsalvatierra.models.dao.UsuarioDaoImpl;

/**
 *
 * @author informatica
 */
public class Principal {
    public static void main(String[] args) {
        PostreDaoImpl D = new PostreDaoImpl();
        D.getAll();
    }
}
