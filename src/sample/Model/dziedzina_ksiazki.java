package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z tabeli dziedzina_ksiazki**/

public class dziedzina_ksiazki {
    private IntegerProperty dziedzina_ksiazki_pk;
    private StringProperty Nazwa_dziedziny;
    private StringProperty opis;

    public int getDziedzina_ksiazki_pk() {
        return dziedzina_ksiazki_pk.get();
    }

    public IntegerProperty dziedzina_ksiazki_pkProperty() {
        return dziedzina_ksiazki_pk;
    }

    public void setDziedzina_ksiazki_pk(int dziedzina_ksiazki_pk) {
        this.dziedzina_ksiazki_pk.set(dziedzina_ksiazki_pk);
    }

    public String getNazwa_dziedziny() {
        return Nazwa_dziedziny.get();
    }

    public StringProperty nazwa_dziedzinyProperty() {
        return Nazwa_dziedziny;
    }

    public void setNazwa_dziedziny(String nazwa_dziedziny) {
        this.Nazwa_dziedziny.set(nazwa_dziedziny);
    }

    public String getOpis() {
        return opis.get();
    }

    public StringProperty opisProperty() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis.set(opis);
    }

    public String getParent_dziedzina_ksiazki_pk() {
        return Parent_dziedzina_ksiazki_pk.get();
    }

    public StringProperty parent_dziedzina_ksiazki_pkProperty() {
        return Parent_dziedzina_ksiazki_pk;
    }

    public void setParent_dziedzina_ksiazki_pk(String parent_dziedzina_ksiazki_pk) {
        this.Parent_dziedzina_ksiazki_pk.set(parent_dziedzina_ksiazki_pk);
    }

    private StringProperty Parent_dziedzina_ksiazki_pk;
}
