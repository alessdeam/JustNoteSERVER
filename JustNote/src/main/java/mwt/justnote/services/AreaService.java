package mwt.justnote.services;

import mwt.justnote.model.Area;
import mwt.justnote.model.AreaUtente;

import java.util.List;

public interface AreaService {

    public List<Area> getAreeByIdUtente(long idUtente) throws JustNoteBusinessException;

    Area getAreaById(Long id) throws JustNoteBusinessException;

    public void insertArea(Area area) throws JustNoteBusinessException;

    public void insertAreaUtente(long idArea, long idUtente) throws JustNoteBusinessException;

    public void updateArea(Area area, Long areaId) throws JustNoteBusinessException;

    public Boolean deleteArea(int idCategoria) throws JustNoteBusinessException;

}
