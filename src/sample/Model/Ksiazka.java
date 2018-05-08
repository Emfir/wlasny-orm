package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

import java.sql.Date;

/** Klasa opsugujaca rekordy z tabeli ksiazka**/

public class Ksiazka {

    private IntegerProperty ksiazka_pk;
    private IntegerProperty jezyk_pk;
    private SimpleObjectProperty<Date>  data_wydania_oryginalu;
    private StringProperty tytul;

    public void setksiazka_pk(int ksiazka_pk) {
        this.ksiazka_pk.set(ksiazka_pk);
    }

    public void setjezyk_pk(int jezyk_pk) {
        this.jezyk_pk.set(jezyk_pk);
    }

    public void setdata_wydania_oryginalu(Date data_wydania_oryginalu) {
        this.data_wydania_oryginalu.set(data_wydania_oryginalu);
    }

    public void settytul(String tytul) {
        this.tytul.set(tytul);
    }

    public Date getData_wydania_oryginalu() {
        return data_wydania_oryginalu.get();
    }

    public SimpleObjectProperty<Date> data_wydania_oryginaluProperty() {
        return data_wydania_oryginalu;
    }

    public int getKsiazka_pk() {
        return ksiazka_pk.get();
    }

    public IntegerProperty ksiazka_pkProperty() {
        return ksiazka_pk;
    }

    public int getJezyk_pk() {
        return jezyk_pk.get();
    }

    public IntegerProperty jezyk_pkProperty() {
        return jezyk_pk;
    }

    public StringProperty tytulProperty() {
        return tytul;
    }
}

