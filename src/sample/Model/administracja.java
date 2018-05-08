package sample.Model;



import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z tabeli administracja**/

public class administracja {
    public int getAdministracja_pk() {
        return administracja_pk.get();
    }

    public IntegerProperty administracja_pkProperty() {
        return administracja_pk;
    }

    public void setAdministracja_pk(int administracja_pk) {
        this.administracja_pk.set(administracja_pk);
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

    public int getNumer_telefonu() {
        return numer_telefonu.get();
    }

    public IntegerProperty numer_telefonuProperty() {
        return numer_telefonu;
    }

    public void setNumer_telefonu(int numer_telefonu) {
        this.numer_telefonu.set(numer_telefonu);
    }

    private IntegerProperty administracja_pk;
    private StringProperty imie;
    private StringProperty nazwisko;
    private IntegerProperty numer_telefonu;
}
