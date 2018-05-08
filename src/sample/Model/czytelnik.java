package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;


/** Klasa opsugujaca rekordy z tabeli czytelnik**/

public class czytelnik {
    public int getCzytelnik_pk() {
        return czytelnik_pk.get();
    }

    public IntegerProperty czytelnik_pkProperty() {
        return czytelnik_pk;
    }

    public void setCzytelnik_pk(int czytelnik_pk) {
        this.czytelnik_pk.set(czytelnik_pk);
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

    public String getHaslo() {
        return haslo.get();
    }

    public StringProperty hasloProperty() {
        return haslo;
    }

    public void setHaslo(String haslo) {
        this.haslo.set(haslo);
    }



    public String getMail() {
        return mail.get();
    }

    public StringProperty mailProperty() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail.set(mail);
    }
    private IntegerProperty czytelnik_pk;
    private StringProperty imie;
    private StringProperty nazwisko;
    private StringProperty mail;
    private StringProperty haslo;
}
