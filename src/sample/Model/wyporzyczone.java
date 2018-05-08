package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleObjectProperty;

import java.sql.Date;

/** Klasa opsugujaca rekordy z tabeli wyporzyczone**/

public class wyporzyczone {
    public int getWyporzyczone_pk() {
        return wyporzyczone_pk.get();
    }

    public IntegerProperty wyporzyczone_pkProperty() {
        return wyporzyczone_pk;
    }

    public void setWyporzyczone_pk(int wyporzyczone_pk) {
        this.wyporzyczone_pk.set(wyporzyczone_pk);
    }

    public int getStan_katalogowy_pk() {
        return stan_katalogowy_pk.get();
    }

    public IntegerProperty stan_katalogowy_pkProperty() {
        return stan_katalogowy_pk;
    }

    public void setStan_katalogowy_pk(int stan_katalogowy_pk) {
        this.stan_katalogowy_pk.set(stan_katalogowy_pk);
    }

    public int getCzytelnik_pk() {
        return czytelnik_pk.get();
    }

    public IntegerProperty czytelnik_pkProperty() {
        return czytelnik_pk;
    }

    public void setCzytelnik_pk(int czytelnik_pk) {
        this.czytelnik_pk.set(czytelnik_pk);
    }

    public Date getData_wyporzyczenia() {
        return data_wyporzyczenia.get();
    }

    public SimpleObjectProperty<Date> data_wyporzyczeniaProperty() {
        return data_wyporzyczenia;
    }

    public void setData_wyporzyczenia(Date data_wyporzyczenia) {
        this.data_wyporzyczenia.set(data_wyporzyczenia);
    }

    public Date getData_zwrotu() {
        return data_zwrotu.get();
    }

    public SimpleObjectProperty<Date> data_zwrotuProperty() {
        return data_zwrotu;
    }

    public void setData_zwrotu(Date data_zwrotu) {
        this.data_zwrotu.set(data_zwrotu);
    }

    private IntegerProperty wyporzyczone_pk;
    private IntegerProperty stan_katalogowy_pk;
    private IntegerProperty czytelnik_pk;
    private SimpleObjectProperty<Date> data_wyporzyczenia;
    private SimpleObjectProperty<Date> data_zwrotu;
}
