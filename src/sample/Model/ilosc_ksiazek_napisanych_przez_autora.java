package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z widoku ilosc_ksiazek_napisanych_przez_autora**/

public class ilosc_ksiazek_napisanych_przez_autora {
    public int getIlosc_napisanych_ksiazek() {
        return ilosc_napisanych_ksiazek.get();
    }

    public IntegerProperty ilosc_napisanych_ksiazekProperty() {
        return ilosc_napisanych_ksiazek;
    }

    public void setIlosc_napisanych_ksiazek(int ilosc_napisanych_ksiazek) {
        this.ilosc_napisanych_ksiazek.set(ilosc_napisanych_ksiazek);
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

    private IntegerProperty ilosc_napisanych_ksiazek;
    private StringProperty imie;
    private StringProperty nazwisko;


}
