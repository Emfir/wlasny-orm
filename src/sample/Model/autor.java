package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z tabeli autor**/

public class autor {
    public int getAutor_pk() {
        return autor_pk.get();
    }

    public IntegerProperty autor_pkProperty() {
        return autor_pk;
    }

    public void setAutor_pk(int autor_pk) {
        this.autor_pk.set(autor_pk);
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

    private IntegerProperty autor_pk;
    private StringProperty imie;
    private StringProperty nazwisko;

}
