package mwt.justnote.services;

import mwt.justnote.model.Categoria;
import mwt.justnote.model.Nota;
import mwt.justnote.model.Utente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public interface CategoriaService {

    public List<Categoria> getCategorieByIdUtente(long idUtente) throws JustNoteBusinessException;

    Categoria getCategoriaById(Long id) throws JustNoteBusinessException;

    public void insertCategoria(Categoria categoria) throws JustNoteBusinessException;

    public void updateCategoria(Categoria categoria, Long categoriaId) throws JustNoteBusinessException;

    public Boolean deleteCategoria(int idCategoria) throws JustNoteBusinessException;

}
