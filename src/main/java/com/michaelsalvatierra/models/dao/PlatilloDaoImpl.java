package com.michaelsalvatierra.models.dao;

import com.michaelsalvatierra.db.*;
import com.michaelsalvatierra.models.domain.Platillo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.michaelsalvatierra.db.Conexion;
import java.sql.SQLException;
import com.michaelsalvatierra.models.idao.IPlatilloDAO;

/**
 *
 * @author W10
 * @date Sep 2, 2022
 * @time 10:30:23 PM
 */
public class PlatilloDaoImpl implements IPlatilloDAO {

    private static final String SQL_SELECT = "SELECT id, nombre, descripcion, precio, descuento, ruta_imagen FROM platillo;";
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Platillo platillo = null;
    private List<Platillo> listaPlatillos = new ArrayList<>();

    @Override
    public List<Platillo> getAll() {
        try {
            con = Conexion.getConnection();
            pstmt = con.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                platillo = new Platillo(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getFloat("precio"),
                        rs.getFloat("descuento"),
                        rs.getString("ruta_imagen")
                );
                System.out.println(platillo.toString());
                listaPlatillos.add(platillo);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(con);
        }
        return listaPlatillos;
    }

    @Override
    public int add(Platillo platillo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int update(Platillo platillo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int delete(Platillo platillo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
