package sample.Kontrolery;

import javafx.collections.FXCollections;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import sample.WarstwaKomunikacjiZBaza.IRepozytorium;
import sample.WarstwaKomunikacjiZBaza.MenadzerRepozytorium;
import sample.Model.*;

import java.lang.reflect.Field;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
/** klasa zajmujaca sie obsluga polecen z graficznego interfejsu urzytkownika**/
public class Kontroler implements Initializable {

    public Button proba;
    public TableView tabela;
    public TextField pole1;
    public TextField pole2;
    public TextField pole3;
    public TextField pole4;
    public TextField pole5;
    public TextField pole6;
    public TextField pole7;
    public TextField pole8;
    public TextField[] formularz;
    private IRepozytorium bazaDanych;
    public IPrzetrzymywaczFunkcji coNaEkranie;
    public IWstawiania iWstawiania;
    public AnchorPane formula;
    public AnchorPane doWst;
    public IFuncjiWyswietlajacej[] iFuncjiWyswietlajacej;
    public int doAktualizacji;


    /**zapamietuje obiekt realizujacy polaczenie z baza danych**/
    public Kontroler() {
        bazaDanych = MenadzerRepozytorium.dajRepozytorium();


    }

    /**funkcja ladujaca rekordy z bazy danych na widok urzytkownika**/
    private <T> void zaladujDane(List<T> dane, Class<T> a) {
        tabela.getColumns().clear();
        tabela.getItems().clear();

        //TableView table = new TableView(FXCollections.observableArrayList(dane));
        StworzKolumny(a, tabela);
        tabela.setItems(FXCollections.observableArrayList(dane));

    }
/** funckja zajmujaca sie zaladowanie odpowiednich kolumn**/
    private void StworzKolumny(Class clazz, TableView table) {
        for (Field method : clazz.getDeclaredFields()) {
            String name = method.getName();
            TableColumn column = new TableColumn(name);
            column.setCellValueFactory(new PropertyValueFactory<>(name));
            table.getColumns().add(column);
        }
    }

    /** funkcja ladujaca domyslny widok**/
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        zaladujDane(bazaDanych.dajKsiazki(), Ksiazka.class);
        formularz = new TextField[]{pole1, pole2, pole3, pole4, pole5, pole6, pole7, pole8};
        iFuncjiWyswietlajacej = new IFuncjiWyswietlajacej[]{this::administracja, this::autor, this::czytelnik,
                 this::dziedzina_ksiazki, this::jezyk, this::ksiazki,
                this::ksiazka_autor, this::ksiazka_dziedzina,  this::stan_katalogowy,
                this::tlumacz, this::wydanie, this::wydawnictwo, this::wyporzyczone};
        try {
            iWstawiania = new KomunikatorWstawiajacy<Ksiazka>(Ksiazka.class);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        coNaEkranie = iWstawiania::wypisz;
        ustawWidocznoscFormularz();
        doAktualizacji = 5;

    }


    /**funckja dostosowujaca metode obslugujaca funkcje wywolujaca wstawianie do bazy danych**/
    public <T> void ustawMetode(Class<T> a) {
        try {
            iWstawiania = new KomunikatorWstawiajacy<T>(a);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        coNaEkranie = iWstawiania::wypisz;


    }

/**funkcja wyswietlajaca dane z tabeli ksiazki**/
    public void ksiazki(MouseEvent mouseEvent) {
        ustawMetode(Ksiazka.class);
        zaladujDane(bazaDanych.dajKsiazki(), Ksiazka.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 5;
    }
    /**funkcja wyswietlajaca dane z tabeli jezyk**/
    public void jezyk(MouseEvent mouseEvent) {
        ustawMetode(jezyk.class);
        zaladujDane(bazaDanych.dajJezyk(), jezyk.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 4;
    }
    /**funkcja wyswietlajaca dane z tabeli autor**/
    public void autor(MouseEvent mouseEvent) {
        ustawMetode(autor.class);
        zaladujDane(bazaDanych.dajAutor(), autor.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 1;
    }
    /**funkcja wyswietlajaca dane z tabeli dziedzina_ksiazki**/
    public void dziedzina_ksiazki(MouseEvent mouseEvent) {
        ustawMetode(dziedzina_ksiazki.class);
        zaladujDane(bazaDanych.dajDziedzinaKsiazki(), dziedzina_ksiazki.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 3;
    }
    /**funkcja wyswietlajaca dane z tabeli ksiazka_autor**/
    public void ksiazka_autor(MouseEvent mouseEvent) {
        ustawMetode(ksiazka_autor.class);
        zaladujDane(bazaDanych.dajKsiazkaAutor(), ksiazka_autor.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 6;
    }
    /**funkcja wyswietlajaca dane z tabeli ksiazka_dziedzina**/
    public void ksiazka_dziedzina(MouseEvent mouseEvent) {
        ustawMetode(ksiazka_dziedzina.class);
        zaladujDane(bazaDanych.dajKsiazkaDziedzina(), ksiazka_dziedzina.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 7;
    }
    /**funkcja wyswietlajaca dane z tabeli stan_katalogowy**/
    public void stan_katalogowy(MouseEvent mouseEvent) {
        ustawMetode(stan_katalogowy.class);
        zaladujDane(bazaDanych.dajStanKatalogowy(), stan_katalogowy.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 8;
    }
    /**funkcja wyswietlajaca dane z tabeli tlumacz**/
    public void tlumacz(MouseEvent mouseEvent) {
        ustawMetode(tlumacz.class);
        zaladujDane(bazaDanych.dajTlumacz(), tlumacz.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 9;
    }
    /**funkcja wyswietlajaca dane z tabeli wydania**/
    public void wydanie(MouseEvent mouseEvent) {
        ustawMetode(wydanie.class);
        zaladujDane(bazaDanych.dajWydanie(), wydanie.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 10;
    }
    /**funkcja wyswietlajaca dane z tabeli wydawnictwo**/
    public void wydawnictwo(MouseEvent mouseEvent) {
        ustawMetode(wydawnictwo.class);
        zaladujDane(bazaDanych.dajWydawnictwo(), wydawnictwo.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 11;
    }
    /**funkcja wyswietlajaca dane z widoku dane_szczegolowe**/
    public void dane_szczegolowe(MouseEvent mouseEvent) {
        zaladujDane(bazaDanych.dajDaneSzczegolowe(), dane_szczegolowe.class);
        wylonczWszystko ();

    }
    /**funkcja wyswietlajaca dane z widoku ilosc_ksiazek_napisanych_prze_autora**/
    public void ilosc_ksiazek_napisanych_przez_autora(MouseEvent mouseEvent) {
        zaladujDane(bazaDanych.dajIloscKsiazek(), ilosc_ksiazek_napisanych_przez_autora.class);
        wylonczWszystko ();
    }
/**funkcja wyswietlajaca dane z wdoku stan**/
    public void stan(MouseEvent mouseEvent) {
        zaladujDane(bazaDanych.dajStan(), stan.class);
        wylonczWszystko ();
    }
    /**funkcja wyswietlajaca dane z tabeli admninistracja**/
    public void administracja(MouseEvent mouseEvent) {
        ustawMetode(administracja.class);
        zaladujDane(bazaDanych.dajAdministacje(), administracja.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 0;
    }
    /**funkcja wyswietlajaca dane z tabeli czytelnik**/
    public void czytelnik(MouseEvent mouseEvent) {
        ustawMetode(czytelnik.class);
        zaladujDane(bazaDanych.dajCzytelinikow(), czytelnik.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 2;
    }
    /**funkcja wyswietlajaca dane z tabeli wyporzyczone**/
    public void wyporzyczone(MouseEvent mouseEvent) {
        ustawMetode(wyporzyczone.class);
        zaladujDane(bazaDanych.dajWyporzyczone(), wyporzyczone.class);
        ustawWidocznoscFormularz();
        doAktualizacji = 12;
    }


/** funkcja inicjujaca wstawianie nowy danych do bazy danych**/
    public void wstaw1(MouseEvent mouseEvent) throws IllegalAccessException, InstantiationException {
        List<String> pomocnicza = new ArrayList<String>();

        for (int j = 0; j < tabela.getColumns().size(); j++) {
            pomocnicza.add(formularz[j].getText());
            formularz[j].clear();
        }

        coNaEkranie.doWstawienia(pomocnicza);
        iFuncjiWyswietlajacej[doAktualizacji].aktualizuj(mouseEvent);
    }
/** ustawia odpowiednio ilosc miejsc do wpisania nowych danych do bazy**/
    public void ustawWidocznoscFormularz() {
        doWst.setVisible(true);
        formula.setVisible(true);
        for (int i = 0; i < 8; i++) {
            formularz[i].setVisible(false);
        }
        for (int j = 0; j < tabela.getColumns().size(); j++) {
            formularz[j].setVisible(true);
        }
    }
    /**wyloncza graficzny interfejs odpowiedzialny za formularz i wstawianie danych**/
    public void wylonczWszystko (){
        doWst.setVisible(false);
        formula.setVisible(false);
    }
}
