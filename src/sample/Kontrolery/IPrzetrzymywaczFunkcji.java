package sample.Kontrolery;

import java.util.List;


/**funkcja przetrzymujaca funkcja odpowiedzialna za przekazanie danych do funkcji wstawiajacej rekordy do bazy danych**/
public interface IPrzetrzymywaczFunkcji {
    void doWstawienia(List<String> text) throws IllegalAccessException, InstantiationException;

}
