package sample.Model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

/** Klasa opsugujaca rekordy z tabeli jezyk**/

public class jezyk {
    public int getJezyk_pk() {
        return jezyk_pk.get();
    }

    public IntegerProperty jezyk_pkProperty() {
        return jezyk_pk;
    }

    public void setJezyk_pk(int jezyk_pk) {
        this.jezyk_pk.set(jezyk_pk);
    }

    public String getJezyk() {
        return jezyk.get();
    }

    public StringProperty jezykProperty() {
        return jezyk;
    }

    public void setJezyk(String jezyk) {
        this.jezyk.set(jezyk);
    }

    private IntegerProperty jezyk_pk;
    private StringProperty jezyk;
}
