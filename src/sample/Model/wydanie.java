package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleObjectProperty;

import java.sql.Date;

/** Klasa opsugujaca rekordy z tabeli wydanie**/

public class wydanie {
    public int getWydanie_pk() {
        return wydanie_pk.get();
    }

    public IntegerProperty wydanie_pkProperty() {
        return wydanie_pk;
    }

    public void setWydanie_pk(int wydanie_pk) {
        this.wydanie_pk.set(wydanie_pk);
    }

    public int getJezyk_pk() {
        return jezyk_pk.get();
    }

    public IntegerProperty jezyk_pkProperty() {
        return jezyk_pk;
    }

    public void setJezyk_pk(int jezyk_pk) {
        this.jezyk_pk.set(jezyk_pk);
    }

    public int getKsiazka_pk() {
        return ksiazka_pk.get();
    }

    public IntegerProperty ksiazka_pkProperty() {
        return ksiazka_pk;
    }

    public void setKsiazka_pk(int ksiazka_pk) {
        this.ksiazka_pk.set(ksiazka_pk);
    }

    public int getTlumacz_pk() {
        return tlumacz_pk.get();
    }

    public IntegerProperty tlumacz_pkProperty() {
        return tlumacz_pk;
    }

    public void setTlumacz_pk(int tlumacz_pk) {
        this.tlumacz_pk.set(tlumacz_pk);
    }

    public int getWydawnictwo_pk() {
        return wydawnictwo_pk.get();
    }

    public IntegerProperty wydawnictwo_pkProperty() {
        return wydawnictwo_pk;
    }

    public void setWydawnictwo_pk(int wydawnictwo_pk) {
        this.wydawnictwo_pk.set(wydawnictwo_pk);
    }

    public Date getData_nowego_wydania() {
        return data_nowego_wydania.get();
    }

    public SimpleObjectProperty<Date> data_nowego_wydaniaProperty() {
        return data_nowego_wydania;
    }

    public void setData_nowego_wydania(Date data_nowego_wydania) {
        this.data_nowego_wydania.set(data_nowego_wydania);
    }

    public int getIlosc_stron() {
        return ilosc_stron.get();
    }

    public IntegerProperty ilosc_stronProperty() {
        return ilosc_stron;
    }

    public void setIlosc_stron(int ilosc_stron) {
        this.ilosc_stron.set(ilosc_stron);
    }

    public int getNumer_wydania() {
        return numer_wydania.get();
    }

    public IntegerProperty numer_wydaniaProperty() {
        return numer_wydania;
    }

    public void setNumer_wydania(int numer_wydania) {
        this.numer_wydania.set(numer_wydania);
    }

    private IntegerProperty wydanie_pk;
    private IntegerProperty jezyk_pk;
    private IntegerProperty ksiazka_pk;
    private IntegerProperty tlumacz_pk;
    private IntegerProperty wydawnictwo_pk;
    private SimpleObjectProperty<Date> data_nowego_wydania;
    private IntegerProperty ilosc_stron;
    private IntegerProperty numer_wydania;
}
