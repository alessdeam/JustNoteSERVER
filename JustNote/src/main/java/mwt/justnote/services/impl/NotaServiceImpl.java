package mwt.justnote.services.impl;

import mwt.justnote.model.Categoria;
import mwt.justnote.model.Nota;
import mwt.justnote.model.NotaCondivisa;
import mwt.justnote.model.Utente;
import mwt.justnote.services.CategoriaService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.NotaService;
import mwt.justnote.services.UtenteService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

public class NotaServiceImpl implements NotaService {

    final private String port = "localhost:3306/justnote";
    final private String user = "root";
    final private String pwd = "";
    final private String timeZone = TimeZone.getTimeZone("Europe/Rome").getID();

    private static final String FIND_NOTE_BY_ID_UTENTE = "SELECT * FROM note WHERE id_utente=?";
    private static final String FIND_NOTE_BY_ID_AREA = "SELECT * FROM note WHERE id_area=?";
    private static final String FIND_NOTE_CONDIVISE_BY_ID_UTENTE = "SELECT * FROM note_condivise WHERE id_utente=?";
    private static final String FIND_NOTE_BY_ID_UTENTE_AND_BY_ID_CATEGORIA = "SELECT * FROM note WHERE id_utente=? AND id_categoria=?";
    private static final String INSERT_NOTA = "INSERT INTO note (titolo, contenuto, colore, id_utente, id_categoria, id_area) VALUES (?,?,?,?,?,?)";
    private static final String UPDATE_NOTA = "UPDATE note SET titolo=?, contenuto=?, colore=?, id_utente=?, id_categoria=? WHERE id=?";
    private static final String DELETE_NOTA = "DELETE FROM note WHERE id=?";
    private static final String INSERT_NOTA_CONDIVISA = "INSERT INTO note_condivise (titolo, contenuto, colore, id_utente, id_categoria, id_nota_parent, permesso_modifica, permesso_condivisione, permesso_cancellazione) VALUES (?,?,?,?,?,?,?,?,?)";

    private CategoriaService categoriaService = new CategoriaServiceImpl();
    private UtenteService utenteService = new UtenteServiceImpl();

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
    public List<Nota> getNoteByIdUtente(Long idUtente) {

        PreparedStatement sql = null;
        Connection connection = null;
        List<Nota> note = new ArrayList<Nota>();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_NOTE_BY_ID_UTENTE);

            sql.setLong(1, idUtente);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                Nota nota = new Nota();
                Categoria categoria = new Categoria();
                Utente utente = new Utente();

                nota.setId(rs.getLong("id"));
                nota.setTitolo(rs.getString("titolo"));
                nota.setContenuto(rs.getString("contenuto"));
                nota.setColore(rs.getString("colore"));
                categoria.setId(rs.getLong("id_categoria"));
                nota.setCategoria(categoria);
                utente.setId(rs.getLong("id_utente"));
                nota.setUtente(utente);

                note.add(nota);
            }
            rs.close();

            return note;
        } catch (SQLException e) {
            return note;
        } finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public List<Nota> getNoteByIdArea(Long idArea) {

        PreparedStatement sql = null;
        Connection connection = null;
        List<Nota> note = new ArrayList<Nota>();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_NOTE_BY_ID_AREA);

            sql.setLong(1, idArea);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                Nota nota = new Nota();
                Categoria categoria = new Categoria();
                Utente utente = new Utente();

                nota.setId(rs.getLong("id"));
                nota.setTitolo(rs.getString("titolo"));
                nota.setContenuto(rs.getString("contenuto"));
                nota.setColore(rs.getString("colore"));
                categoria.setId(rs.getLong("id_categoria"));
                nota.setCategoria(categoria);
                utente.setId(rs.getLong("id_utente"));
                nota.setUtente(utente);

                note.add(nota);
            }
            rs.close();

            return note;
        } catch (SQLException e) {
            return note;
        } finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public List<NotaCondivisa> getNoteCondiviseByIdUtente(Long idUtente) {

        PreparedStatement sql = null;
        Connection connection = null;
        List<NotaCondivisa> noteCondivise = new ArrayList<NotaCondivisa>();

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_NOTE_CONDIVISE_BY_ID_UTENTE);

            sql.setLong(1, idUtente);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                NotaCondivisa notaCondivisa = new NotaCondivisa();
                Categoria categoria = new Categoria();
                Utente utente = new Utente();
                Nota notaParent = new Nota();

                notaCondivisa.setId(rs.getLong("id"));
                notaCondivisa.setTitolo(rs.getString("titolo"));
                notaCondivisa.setContenuto(rs.getString("contenuto"));
                notaCondivisa.setColore(rs.getString("colore"));
                categoria.setId(rs.getLong("id_categoria"));
                notaCondivisa.setCategoria(categoria);
                utente.setId(rs.getLong("id_utente"));
                notaCondivisa.setUtente(utente);
                notaParent.setId(rs.getLong("id_nota_parent"));
                notaCondivisa.setNotaParent(notaParent);
                notaCondivisa.setPermessoModifica(rs.getBoolean("permesso_modifica"));
                notaCondivisa.setPermessoCondivisione(rs.getBoolean("permesso_condivisione"));
                notaCondivisa.setPermessoCancellazione(rs.getBoolean("permesso_cancellazione"));

                noteCondivise.add(notaCondivisa);
            }
            rs.close();

            return noteCondivise;
        } catch (SQLException e) {
            return noteCondivise;
        } finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
    public List<Nota> getNoteByIdUtenteAndIdCategoria(Long idUtente, Long idCategoria) {

        PreparedStatement sql = null;
        Connection connection = null;
        List<Nota> note = new ArrayList<Nota>();

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            sql = connection.prepareStatement(FIND_NOTE_BY_ID_UTENTE_AND_BY_ID_CATEGORIA);

            sql.setLong(1, idUtente);
            sql.setLong(2, idCategoria);

            ResultSet rs = sql.executeQuery();

            while(rs.next()) {

                Nota nota = new Nota();
                Categoria categoria = new Categoria();
                Utente utente = new Utente();

                nota.setId(rs.getLong("id"));
                nota.setTitolo(rs.getString("titolo"));
                nota.setContenuto(rs.getString("contenuto"));
                nota.setColore(rs.getString("colore"));
                nota.setCategoria(categoriaService.getCategoriaById(rs.getLong("id_categoria")));
                utente.setId(rs.getLong("id_utente"));
                nota.setUtente(utente);

                note.add(nota);
            }
            rs.close();

            return note;
        } catch (SQLException e) {
            return note;
        } catch (JustNoteBusinessException e) {
            e.printStackTrace();
        } finally {
            if (sql != null) {
                try {
                    sql.close();
                } catch (SQLException e) {
                }
            }
        }
        return note;
    }

    @Override
    public void insertNota(Nota nota) throws JustNoteBusinessException {

        PreparedStatement st = null;
        Connection connection = null;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);
            st = connection.prepareStatement(INSERT_NOTA);
            st.setString(1, nota.getTitolo());
            st.setString(2, nota.getContenuto());
            st.setString(3, nota.getColore());
            if(nota.getUtente() != null) {
                st.setLong(4, nota.getUtente().getId());
            } else {
                st.setLong(4, 0);
            }
            if(nota.getCategoria() != null) {
                st.setLong(5, nota.getCategoria().getId());
            } else {
                st.setLong(5, 0);
            }
            if(nota.getArea() != null) {
                st.setLong(6, nota.getArea().getId());
            } else {
                st.setLong(6, 0);
            }
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
    public void updateNota(Nota nota, Long notaId) throws JustNoteBusinessException {

        PreparedStatement ps = null;
        Connection connection = null;

        try {
                connection = this.getConnection(connection);
                connection.setAutoCommit(false);

                ps = connection.prepareStatement(UPDATE_NOTA);

                ps.setString(1, nota.getTitolo());
                ps.setString(2, nota.getContenuto());
                ps.setString(3, nota.getColore());
                ps.setLong(4, nota.getUtente().getId());
                ps.setLong(5, nota.getCategoria().getId());
                ps.setLong(6, notaId);

                if(ps.executeUpdate() == 1) {
                    //System.out.println("Nota updated");
                }else {
                    //System.out.println("Nota not updated");
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
    public Boolean deleteNota(int idNota) throws JustNoteBusinessException {
        PreparedStatement ps = null;
        Connection connection = null;

        Boolean response = false;

        try {

            connection = this.getConnection(connection);
            connection.setAutoCommit(false);

            ps = connection.prepareStatement(DELETE_NOTA);

            ps.setLong(1, idNota);

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

    @Override
    public void condividiNota(NotaCondivisa notaCondivisa, String email) throws JustNoteBusinessException {

        PreparedStatement st = null;
        Connection connection = null;

        try {
            connection = this.getConnection(connection);
            connection.setAutoCommit(false);
            st = connection.prepareStatement(INSERT_NOTA_CONDIVISA);
            st.setString(1, notaCondivisa.getTitolo());
            st.setString(2, notaCondivisa.getContenuto());
            st.setString(3, notaCondivisa.getColore());
            Utente utente = utenteService.getUtenteByEmail(email);
            st.setLong(4, utente.getId());
            st.setLong(5, notaCondivisa.getCategoria().getId());
            st.setLong(6, notaCondivisa.getNotaParent().getId());
            st.setBoolean(7, notaCondivisa.isPermessoModifica());
            st.setBoolean(8, notaCondivisa.isPermessoCondivisione());
            st.setBoolean(9, notaCondivisa.isPermessoCancellazione());
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
}
