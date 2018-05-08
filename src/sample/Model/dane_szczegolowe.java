package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.StringProperty;

import java.sql.Date;
/** Klasa opsugujaca rekordy z widoku dane_szczegolowe**/

public class dane_szczegolowe {
    public int getIlosc_dostepnych_egzemplarzy() {
        return ilosc_dostepnych_egzemplarzy.get();
    }

    public IntegerProperty ilosc_dostepnych_egzemplarzyProperty() {
        return ilosc_dostepnych_egzemplarzy;
    }

    public void setIlosc_dostepnych_egzemplarzy(int ilosc_dostepnych_egzemplarzy) {
        this.ilosc_dostepnych_egzemplarzy.set(ilosc_dostepnych_egzemplarzy);
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

    public int getNumer_wydania() {
        return numer_wydania.get();
    }

    public IntegerProperty numer_wydaniaProperty() {
        return numer_wydania;
    }

    public void setNumer_wydania(int numer_wydania) {
        this.numer_wydania.set(numer_wydania);
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

    public String getNazwa_wydawnictwa() {
        return nazwa_wydawnictwa.get();
    }

    public StringProperty nazwa_wydawnictwaProperty() {
        return nazwa_wydawnictwa;
    }

    public void setNazwa_wydawnictwa(String nazwa_wydawnictwa) {
        this.nazwa_wydawnictwa.set(nazwa_wydawnictwa);
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

    private IntegerProperty ilosc_dostepnych_egzemplarzy;
    private StringProperty tytul;
    private StringProperty imie;
    private StringProperty nazwisko;
    private IntegerProperty numer_wydania;
    private SimpleObjectProperty<Date> data_nowego_wydania;
    private StringProperty nazwa_wydawnictwa;
    private IntegerProperty ilosc_stron;

}
