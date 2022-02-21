package mwt.justnote.services.impl;

import mwt.justnote.model.Categoria;
import mwt.justnote.model.Nota;
import mwt.justnote.model.Utente;
import mwt.justnote.services.CategoriaService;
import mwt.justnote.services.JustNoteBusinessException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

public class CategoriaServiceImpl implements CategoriaService {

    final private String port = "localhost:3306/justnote";
    final private String user = "root";
    final private String pwd = "";
    final private String timeZone = TimeZone.getTimeZone("Europe/Rome").getID();

    private static final String FIND_CATEGORIE_BY_UTENTE = "SELECT * FROM categorie where id_utente=?";
    private static final String FIND_CATEGORIE_BY_AREA = "SELECT * FROM categorie where id_area=?";
    private static final String FIND_CATEGORIA = "SELECT * FROM categorie where id=?";
    private static final String INSERT_CATEGORIA = "INSERT INTO categorie (nome, id_utente, id_area) VALUES (?,?,?)";
    private static final String UPDATE_CATEGORIA = "UPDATE categorie SET nome=?, id_utente=? WHERE id=?";
    private static final String DELETE_CATEGORIA = "DELETE FROM categorie WHERE id=?";

    public Connection getConnection(Connection connection) {
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                //System.out.println("Errore Connessione");
                e.printStackTrace();
            }
            connection = DriverManager.getConnection("jdbc:mysql://" + port + "?user=" + user + "&password=" + pwd
                    + "&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone="
                    + timeZone);
            //System.out.println("Connection established");
        } catch (Exception e) {
            //System.out.println("SQLException: " + e.getMessage());
        }
        return connection;
    }

    @Override
    public List<Categoria> getCategorieByIdUtente(long idUtente) {

        PreparedStatement sql = null;
        Connection connection = null;
        List<Categoria> categorie = new ArrayList<Categoria>();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_CATEGORIE_BY_UTENTE);

            sql.setLong(1, idUtente);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                Categoria categoria = new Categoria();

                categoria.setId(rs.getLong("id"));
                categoria.setNome(rs.getString("nome"));

                categorie.add(categoria);
            }
            rs.close();

            return categorie;
        } catch (SQLException e) {
            return categorie;
        }finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public List<Categoria> getCategorieByIdArea(long idArea) {

        PreparedStatement sql = null;
        Connection connection = null;
        List<Categoria> categorie = new ArrayList<Categoria>();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_CATEGORIE_BY_AREA);

            sql.setLong(1, idArea);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                Categoria categoria = new Categoria();

                categoria.setId(rs.getLong("id"));
                categoria.setNome(rs.getString("nome"));

                categorie.add(categoria);
            }
            rs.close();

            return categorie;
        } catch (SQLException e) {
            return categorie;
        }finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public Categoria getCategoriaById(Long id) {

        PreparedStatement sql = null;
        Connection connection = null;

        Categoria categoria = new Categoria();
        Utente utente = new Utente();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_CATEGORIA);

            sql.setLong(1, id);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                categoria.setId(rs.getLong("id"));
                categoria.setNome(rs.getString("nome"));

            }
            return categoria;
        } catch (SQLException e) {
            return categoria;
        }finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public void insertCategoria(Categoria categoria) throws JustNoteBusinessException {

        PreparedStatement st = null;
        Connection connection = null;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);
            st = connection.prepareStatement(INSERT_CATEGORIA);
            st.setString(1, categoria.getNome());
            st.setLong(2, categoria.getUtente().getId());
            st.setLong(3, categoria.getArea().getId());
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new JustNoteBusinessException("Something was wrong with Insert an Attraction..");
        } finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public void updateCategoria(Categoria categoria, Long categoriaId) throws JustNoteBusinessException {

        PreparedStatement ps = null;
        Connection connection = null;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            ps = connection.prepareStatement(UPDATE_CATEGORIA);

            ps.setString(1, categoria.getNome());
            ps.setLong(2, categoria.getUtente().getId());
            ps.setLong(3, categoriaId);

            if(ps.executeUpdate() == 1) {
                //System.out.println("Categoria updated");
            }else {
                //System.out.println("Categoria not updated");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            throw new JustNoteBusinessException("Something was wrong with Update an Nota..");
        }
        finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    @Override
    public Boolean deleteCategoria(int idCategoria) throws JustNoteBusinessException {

        PreparedStatement ps = null;
        Connection connection = null;

        Boolean response = false;

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

                ps = connection.prepareStatement(DELETE_CATEGORIA);

                ps.setLong(1, idCategoria);

                if(ps.executeUpdate() == 1) {
                    response = true;
                }else {
                    response = false;
                }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new JustNoteBusinessException("Something was wrong with Deleting an Attraction..");
        } finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                }
            }
        }
        return response;
    }

}
