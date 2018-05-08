package sample.Kontrolery;

import sample.WarstwaKomunikacjiZBaza.MenadzerRepozytorium;

import java.util.List;
/** funkcja implementujaca interfejs obslugujaca wiele obietkow**/
public class KomunikatorWstawiajacy<T> implements IWstawiania {
    T obiekt;
    KomunikatorWstawiajacy(Class<T> a) throws IllegalAccessException, InstantiationException {
        obiekt = a.newInstance();
    }




    public void wypisz(List<String> a) {
        System.out.println(obiekt.getClass().getSimpleName());
        MenadzerRepozytorium.dajRepozytorium().wstaw(a, obiekt.getClass());
    }

}
