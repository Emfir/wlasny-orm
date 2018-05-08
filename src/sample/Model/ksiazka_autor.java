package sample.Model;

import javafx.beans.property.IntegerProperty;
/** Klasa opsugujaca rekordy z tabeli ksiazka_autor**/

public class ksiazka_autor {
    private IntegerProperty ksiazka_autor_pk;
    private IntegerProperty ksiazka_pk;

    public int getKsiazka_autor_pk() {
        return ksiazka_autor_pk.get();
    }

    public IntegerProperty ksiazka_autor_pkProperty() {
        return ksiazka_autor_pk;
    }

    public void setKsiazka_autor_pk(int ksiazka_autor_pk) {
        this.ksiazka_autor_pk.set(ksiazka_autor_pk);
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

    public int getAutor_pk() {
        return autor_pk.get();
    }

    public IntegerProperty autor_pkProperty() {
        return autor_pk;
    }

    public void setAutor_pk(int autor_pk) {
        this.autor_pk.set(autor_pk);
    }

    private IntegerProperty autor_pk;

}
