package sample.WarstwaKomunikacjiZBaza;

import sample.Model.*;

import java.util.List;
/** Interfejs deklarujacy funkcje sluzace do komunikacji z baza danych**/
public interface IRepozytorium {
    /** zwraza liste rekordow z tebeli ksiazki **/
    List<Ksiazka> dajKsiazki();
    /** zwraza liste rekordow z tebeli jezyk **/
    public List<jezyk> dajJezyk();
    /** zwraza liste rekordow z tebeli autor**/
    public List<autor> dajAutor();
    /** zwraza liste rekordow z tebeli dziedzina_ksiazki**/
    public List<dziedzina_ksiazki> dajDziedzinaKsiazki();
    /** zwraza liste rekordow z tebeli ksiazka_autor **/
    public List<ksiazka_autor> dajKsiazkaAutor();
    /** zwraza liste rekordow z tebeli ksiazka_dziedzina **/
    public List<ksiazka_dziedzina> dajKsiazkaDziedzina();
    /** zwraza liste rekordow z tebeli Stan_katalogowy **/
    public List<stan_katalogowy> dajStanKatalogowy();
    /** zwraza liste rekordow z tebeli tlumacz**/
    public List<tlumacz> dajTlumacz();
    /** zwraza liste rekordow z tebeli wydanie**/
    public List<wydanie> dajWydanie();
    /** zwraza liste rekordow z tebeli wydawnictwo**/
    public List<wydawnictwo> dajWydawnictwo();
    /** zwraza liste rekordow z widoku ilosc_ksiazek_napisanych_przez_autora**/
    public List<ilosc_ksiazek_napisanych_przez_autora> dajIloscKsiazek();
    /** zwraza liste rekordow z widoku Stan**/
    public List<stan> dajStan();
    /** zwraza liste rekordow z widoku dane_szczegolowe**/
    public List<dane_szczegolowe> dajDaneSzczegolowe();
    /** zwraza liste rekordow z tebeli czytelnik **/
    public List<czytelnik> dajCzytelinikow();
    /** zwraza liste rekordow z tebeli administracja **/
    public List<administracja> dajAdministacje();
    /** zwraza liste rekordow z tebeli wyporzyczone**/
    public List<wyporzyczone> dajWyporzyczone();
    /** funkcja generyczna wstawiajaca nowe rekordy do tabel**/
    public <T>void wstaw(List<String> lista, Class<T> a) ;

}
