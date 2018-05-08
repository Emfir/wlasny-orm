package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z widoku stan**/

public class stan {
    public int getCount() {
        return count.get();
    }

    public IntegerProperty countProperty() {
        return count;
    }

    public void setCount(int count) {
        this.count.set(count);
    }

    public String getTytul() {
        return tytul.get();
    }

    public StringProperty tytulProperty() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul.set(tytul);
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

    private IntegerProperty count;
    private StringProperty tytul;
    private StringProperty imie;
    private StringProperty nazwisko;
}
