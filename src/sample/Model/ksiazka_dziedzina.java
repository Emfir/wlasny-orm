package sample.Model;

import javafx.beans.property.IntegerProperty;

/** Klasa opsugujaca rekordy z tabeli ksiazka_dziedzina**/

public class ksiazka_dziedzina {
    public int getKsiazka_dziedzina_pk() {
        return ksiazka_dziedzina_pk.get();
    }

    public IntegerProperty ksiazka_dziedzina_pkProperty() {
        return ksiazka_dziedzina_pk;
    }

    public void setKsiazka_dziedzina_pk(int ksiazka_dziedzina_pk) {
        this.ksiazka_dziedzina_pk.set(ksiazka_dziedzina_pk);
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

    public int getDziedzina_ksiazki_pk() {
        return dziedzina_ksiazki_pk.get();
    }

    public IntegerProperty dziedzina_ksiazki_pkProperty() {
        return dziedzina_ksiazki_pk;
    }

    public void setDziedzina_ksiazki_pk(int dziedzina_ksiazki_pk) {
        this.dziedzina_ksiazki_pk.set(dziedzina_ksiazki_pk);
    }

    private IntegerProperty ksiazka_dziedzina_pk;
    private IntegerProperty ksiazka_pk;
    private IntegerProperty dziedzina_ksiazki_pk;
}
