package sample.WarstwaKomunikacjiZBaza;


/** Klasa singleton tworząca i zwracajaca obiekt zajmujacy sie komunikacja z baza danych**/
public class MenadzerRepozytorium {


    private static IRepozytorium _repozytoriumPostgres = new RepozytoriumPostgres();



    public static IRepozytorium dajRepozytorium() {
        return _repozytoriumPostgres;
    }

}