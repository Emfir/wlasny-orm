package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z tabeli wydawnictwo**/

public class wydawnictwo {
    public int getWydawnictwo_pk() {
        return wydawnictwo_pk.get();
    }

    public IntegerProperty wydawnictwo_pkProperty() {
        return wydawnictwo_pk;
    }

    public void setWydawnictwo_pk(int wydawnictwo_pk) {
        this.wydawnictwo_pk.set(wydawnictwo_pk);
    }

    public String getNazwa_wydawnictwa() {
        return Nazwa_wydawnictwa.get();
    }

    public StringProperty nazwa_wydawnictwaProperty() {
        return Nazwa_wydawnictwa;
    }

    public void setNazwa_wydawnictwa(String nazwa_wydawnictwa) {
        this.Nazwa_wydawnictwa.set(nazwa_wydawnictwa);
    }

    private IntegerProperty wydawnictwo_pk;
    private StringProperty Nazwa_wydawnictwa;
}
