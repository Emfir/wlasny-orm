package sample.Kontrolery;

import javafx.scene.input.MouseEvent;
/** slurzy do przetrzymania funkcji do aktualizacji wyswietlanych danych po wstawieniu do bazy danych nowego rekordu**/
public interface IFuncjiWyswietlajacej {
    void aktualizuj(MouseEvent zdarzenie);
}
