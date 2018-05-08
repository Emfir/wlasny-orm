package sample.Model;

import javafx.beans.property.IntegerProperty;

/** Klasa opsugujaca rekordy z tabeli stan_katalogy**/

public class stan_katalogowy {
    public int getStan_katalogowy_pk() {
        return stan_katalogowy_pk.get();
    }

    public IntegerProperty stan_katalogowy_pkProperty() {
        return stan_katalogowy_pk;
    }

    public void setStan_katalogowy_pk(int stan_katalogowy_pk) {
        this.stan_katalogowy_pk.set(stan_katalogowy_pk);
    }

    public int getWydanie_pk() {
        return wydanie_pk.get();
    }

    public IntegerProperty wydanie_pkProperty() {
        return wydanie_pk;
    }

    public void setWydanie_pk(int wydanie_pk) {
        this.wydanie_pk.set(wydanie_pk);
    }

    private IntegerProperty stan_katalogowy_pk;
    private IntegerProperty wydanie_pk;
}
