package mwt.justnote.services.impl;

import mwt.justnote.model.Area;
import mwt.justnote.model.AreaUtente;
import mwt.justnote.model.Utente;
import mwt.justnote.services.AreaService;
import mwt.justnote.services.JustNoteBusinessException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

public class AreaServiceImpl implements AreaService {

    final private String port = "localhost:3306/justnote";
    final private String user = "root";
    final private String pwd = "";
    final private String timeZone = TimeZone.getTimeZone("Europe/Rome").getID();

    private static final String FIND_AREE_BY_UTENTE = "SELECT * FROM aree_utenti where id_utente=?";
    private static final String FIND_AREA = "SELECT * FROM aree where id=?";
    private static final String INSERT_AREA = "INSERT INTO aree (nome) VALUES (?)";
    private static final String INSERT_AREA_UTENTE = "INSERT INTO aree_utenti (id_area, id_utente) VALUES (?,?)";
    private static final String UPDATE_AREA = "UPDATE aree SET nome=?, id_utente=? WHERE id=?";
    private static final String DELETE_AREA = "DELETE FROM aree WHERE id=?";

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
    public List<Area> getAreeByIdUtente(long idUtente) {

        PreparedStatement sqlAreeUtenti = null;
        PreparedStatement sqlAree = null;
        Connection connection = null;
        List<Area> aree = new ArrayList<Area>();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sqlAreeUtenti = connection.prepareStatement(FIND_AREE_BY_UTENTE);
            sqlAree = connection.prepareStatement(FIND_AREA);

            sqlAreeUtenti.setLong(1, idUtente);

            ResultSet rsAreaUtente = sqlAreeUtenti.executeQuery();

            while(rsAreaUtente.next()) {

                sqlAree.setLong(1, rsAreaUtente.getLong("id_area"));

                ResultSet rsArea = sqlAree.executeQuery();

                while(rsArea.next()) {

                    Area area = new Area();

                    area.setId(rsArea.getLong("id"));
                    area.setNome(rsArea.getString("nome"));

                    aree.add(area);
                }
                rsArea.close();
            }
            rsAreaUtente.close();

            return aree;
        } catch (SQLException e) {
            return aree;
        }finally {
            if (sqlAreeUtenti != null) {
                try {
                    sqlAreeUtenti.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public Area getAreaById(Long id) {

        PreparedStatement sql = null;
        Connection connection = null;

        Area area = new Area();
        Utente utente = new Utente();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_AREA);

            sql.setLong(1, id);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                area.setId(rs.getLong("id"));
                area.setNome(rs.getString("nome"));

            }
            return area;
        } catch (SQLException e) {
            return area;
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
    public void insertArea(Area area) throws JustNoteBusinessException {

        PreparedStatement st = null;
        Connection connection = null;
        long generatedKey = 0;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);
            st = connection.prepareStatement(INSERT_AREA, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, area.getNome());
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                generatedKey = rs.getLong(1);
            }

            for (Utente utente: area.getUtenti()) {
                insertAreaUtente(generatedKey, utente.getId());
            }

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
    public void insertAreaUtente(long idArea, long idUtente) throws JustNoteBusinessException {

        PreparedStatement st = null;
        Connection connection = null;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);
            st = connection.prepareStatement(INSERT_AREA_UTENTE);
            st.setLong(1, idArea);
            st.setLong(2, idUtente);
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
    public void updateArea(Area area, Long areaId) throws JustNoteBusinessException {

        PreparedStatement ps = null;
        Connection connection = null;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            ps = connection.prepareStatement(UPDATE_AREA);

            ps.setString(1, area.getNome());
            ps.setLong(3, areaId);

            if(ps.executeUpdate() == 1) {
                //System.out.println("Area updated");
            }else {
                //System.out.println("Area not updated");
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
    public Boolean deleteArea(int idArea) throws JustNoteBusinessException {

        PreparedStatement ps = null;
        Connection connection = null;

        Boolean response = false;

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

                ps = connection.prepareStatement(DELETE_AREA);

                ps.setLong(1, idArea);

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
