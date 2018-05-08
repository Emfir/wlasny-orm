package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z tabeli tlumacz**/

public class tlumacz {
    public int getTlumacz_pk() {
        return tlumacz_pk.get();
    }

    public IntegerProperty tlumacz_pkProperty() {
        return tlumacz_pk;
    }

    public void setTlumacz_pk(int tlumacz_pk) {
        this.tlumacz_pk.set(tlumacz_pk);
    }

    public String getImie() {
        return imie.get();
    }

    public StringProperty imieProperty() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie.set(imie);
    }

    public String getNazwisko() {
        return nazwisko.get();
    }

    public StringProperty nazwiskoProperty() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko.set(nazwisko);
    }

    private IntegerProperty tlumacz_pk;
    private StringProperty imie;
    private StringProperty nazwisko;
}
