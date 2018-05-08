package sample.WarstwaKomunikacjiZBaza;

import javafx.beans.property.*;
import sample.Model.*;

import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.lang.Integer.*;


/**   Klasa implementujaca funckcje interfeju IRepositori. Jest odpowiedzialna za komunikacje z baza danych **/
public class RepozytoriumPostgres implements IRepozytorium {

    private Connection polaczenie;

    //** zajmuje sie poloczeniem z baza danych **//
    private void Polacz() {
        System.out.println("Sprawdzenie czy sterownik jest zarejestrowany w menadzerze");
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException cnfe) {
            System.out.println("Nie znaleziono sterownika!");
            System.out.println("Wydruk sledzenia bledu i zakonczenie.");
            cnfe.printStackTrace();
            System.exit(1);
        }
        System.out.println("Zarejstrowano sterownik - OK, kolejny krok nawiazanie polaczenia z baza danych.");

        Connection c = null;


        try {

            c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "5gorszczak");
        } catch (SQLException se) {
            System.out.println("Brak polaczenia z baza danych, wydruk logu sledzenia i koniec.");
            se.printStackTrace();
            System.exit(1);
        }
        System.out.println("Polaczenie z baza danych OK ! ");

        polaczenie = c;
    }

    /**  rozlacza sie z baza danych**/
    void Rozlacz() throws SQLException {
        try {
            if (polaczenie != null && !polaczenie.isClosed()) {
                polaczenie.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

/** Laczy z baza danych**/
    public RepozytoriumPostgres() {
        Polacz();
    }


/** funkcja generyczna zajmujaca sie tworzeniem kwerendy wyswietlajaca cala zawartosc tabeli  i zwracjaca liste rekordow**/
    public <T> List<T> doZwrotu(Class<T> c) {
        List<T> obiekty = null;
        try {
            String a = "SELECT *  FROM " + c.getSimpleName();
            obiekty = RealizacjaKwerend(c, a);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obiekty;

    }

    @Override
    public List<Ksiazka> dajKsiazki() {
//        List<Ksiazka> ksiazki = null;
//        try {
//            String a = "SELECT *  FROM " + Ksiazka.class.getSimpleName();
//            ksiazki = RealizacjaKwerend(Ksiazka.class, a);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return doZwrotu(Ksiazka.class);
    }

    @Override
    public List<jezyk> dajJezyk() {
        return doZwrotu(jezyk.class);
    }

    @Override
    public List<autor> dajAutor() {

        return doZwrotu(autor.class);
    }

    @Override
    public List<dziedzina_ksiazki> dajDziedzinaKsiazki() {
        return doZwrotu(dziedzina_ksiazki.class);
    }

    @Override
    public List<ksiazka_autor> dajKsiazkaAutor() {
        return doZwrotu(ksiazka_autor.class);
    }

    @Override
    public List<ksiazka_dziedzina> dajKsiazkaDziedzina() {
        return doZwrotu(ksiazka_dziedzina.class);
    }

    @Override
    public List<stan_katalogowy> dajStanKatalogowy() {
        return doZwrotu(stan_katalogowy.class);
    }

    @Override
    public List<tlumacz> dajTlumacz() {
        return doZwrotu(tlumacz.class);
    }

    @Override
    public List<wydanie> dajWydanie() {
        return doZwrotu(wydanie.class);
    }

    @Override
    public List<wydawnictwo> dajWydawnictwo() {
        return doZwrotu(wydawnictwo.class);
    }

    @Override
    public List<ilosc_ksiazek_napisanych_przez_autora> dajIloscKsiazek() {
        return doZwrotu(ilosc_ksiazek_napisanych_przez_autora.class);
    }

    @Override
    public List<stan> dajStan() {
        return doZwrotu(stan.class);
    }

    @Override
    public List<dane_szczegolowe> dajDaneSzczegolowe() {
        return doZwrotu(dane_szczegolowe.class);
    }

    @Override
    public List<czytelnik> dajCzytelinikow() {
        return doZwrotu(czytelnik.class);
    }

    @Override
    public List<administracja> dajAdministacje() {
        return doZwrotu(administracja.class);
    }

    @Override
    public List<wyporzyczone> dajWyporzyczone() {
        return doZwrotu(wyporzyczone.class);
    }

/** funkcja generyczna zajmujaca sie realizacja kwerendy wyswietlajacej cala zawartosc tabeli i opokowujaca rekordy w odpowiedni obiekt**/
    private <T> List<T> RealizacjaKwerend(Class<T> c, String query) throws Exception {

        List<T> obiekty = new ArrayList<T>();
        if (polaczenie != null) {
            System.out.println("Polaczenie z baza danych OK ! ");
            try {
                //  Wykonanie zapytania SELECT do bazy danych
                //  Wykorzystane elementy: createStatement() i executeQuery()
                Statement st = polaczenie.createStatement();
                ResultSet rs = st.executeQuery(query);
                T temp;
                while (rs.next()) {
                    temp = c.newInstance();

                    //to do: Extract this conversion to new method or some static extention class
                    for (Field field : c.getDeclaredFields()) {
                        String name = field.getName();
                        Type x = field.getType();
                        field.setAccessible(true);
                        if (x.getTypeName() == "javafx.beans.property.IntegerProperty") {
                            field.set(temp, new SimpleIntegerProperty(rs.getInt(name)));
                        } else if (x.getTypeName() == "javafx.beans.property.StringProperty") {
                            field.set(temp, new SimpleStringProperty(rs.getString(name)));
                        } else if (x.getTypeName() == "javafx.beans.property.DoubleProperty") {
                            field.set(temp, new SimpleDoubleProperty(rs.getDouble(name)));
                        } else if (x.getTypeName() == "javafx.beans.property.SimpleObjectProperty") {
                            field.set(temp, new SimpleObjectProperty<Date>(rs.getDate(name)));
                        }
                    }
                    obiekty.add(temp);
                }
                rs.close();
                st.close();
            } catch (SQLException e) {
                System.out.println("Blad podczas przetwarzania danych:" + e);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return obiekty;
    }

    public <T> void wstaw(List<String> lista, Class<T> a) {
        Field[] pola = a.getDeclaredFields();
        String kwerenda = "INSERT INTO " + a.getSimpleName() + " (" + pola[0].getName();
        String wartos = "VALUES ( ?";

        for (int i = 1; i < lista.size(); i++) {
            kwerenda += ", " + pola[i].getName();
            wartos += ", ? ";
        }
        kwerenda += ") " + wartos + " ) ";
        String chwilowePrzechowanie;

        try {
            // System.out.println(Date.parse(lista.get(2)));
            PreparedStatement pst = polaczenie.prepareStatement(kwerenda);

            for (int i = 1; i <= pola.length; i++) {
                chwilowePrzechowanie = pola[i - 1].getType().getSimpleName();

                if (chwilowePrzechowanie.equals("IntegerProperty")) {
                    pst.setInt(i, parseInt(lista.get(i - 1)));
                } else if (chwilowePrzechowanie.equals("StringProperty")) {
                    pst.setString(i, lista.get(i - 1));
                } else if (chwilowePrzechowanie.equals("SimpleObjectProperty")) {
                    pst.setDate(i, java.sql.Date.valueOf(lista.get(i - 1)));
                }

            }

            int rows;
            rows = pst.executeUpdate();
            System.out.print("Polecenie 1 -  INSERT - ilosc dodanych rekordow: ");
            System.out.println(rows);


            pst.close();
        } catch (SQLException e) {
            System.out.println("Blad podczas przetwarzania danych:" + e);
        }
    }
}

