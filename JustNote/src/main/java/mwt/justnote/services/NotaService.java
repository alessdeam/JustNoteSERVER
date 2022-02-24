package mwt.justnote.services;

import mwt.justnote.model.Categoria;
import mwt.justnote.model.Nota;
import mwt.justnote.model.NotaCondivisa;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public interface NotaService {

    public List<Nota> getNoteByIdUtente(Long idUtente) throws JustNoteBusinessException;

    public List<Nota> getNoteByIdArea(Long idArea) throws JustNoteBusinessException;

    public List<NotaCondivisa> getNoteCondiviseByIdUtente(Long idUtente) throws JustNoteBusinessException;

    public List<NotaCondivisa> getNoteCondiviseByIdNotaParent(Long idNotaParent) throws JustNoteBusinessException;

    public List<Nota> getNoteByIdUtenteAndIdCategoria(Long idUtente, Long idCategoria) throws JustNoteBusinessException;

    public void insertNota(Nota nota) throws JustNoteBusinessException;

    public void updateNota(Nota nota, Long notaId) throws JustNoteBusinessException;

    public void updateNotaCondivisa(Nota nota, Long notaCondivisaId) throws JustNoteBusinessException;

    public Boolean deleteNota(long idNota) throws JustNoteBusinessException;

    public Boolean deleteNotaCondivisa(long idNotaCondivisa) throws JustNoteBusinessException;

    public void condividiNota(NotaCondivisa notaCondivisa, String email) throws JustNoteBusinessException;

}
