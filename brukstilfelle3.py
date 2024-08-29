import sqlite3

# lager en funksjon som finner prisen til en billett basert på kunden sin gruppe, og navnet på teaterstykket. 
def setPris(teater_navn, kunde_navn):
    pris = None
    gruppe = None

    # Henter gruppen til kunden basert på navnet
    with sqlite3.connect('teater.db') as conn:
        cursor = conn.cursor()
        cursor.execute(f"SELECT GruppeType FROM Kundeprofil WHERE Navn = '{kunde_navn}'")
        row = cursor.fetchone()
        if row:
            gruppe = row[0]

    if teater_navn == "Størst av alt er kjærligheten":
        if gruppe == "Ordinær":
            pris = 350
        elif gruppe == "Honnør":
            pris = 300
        elif gruppe == "Student":
            pris = 220
        elif gruppe == "Barn":
            pris = 220
        elif gruppe == "Gruppe 10:":
            pris = 320
        elif gruppe == "Gruppe honnør 10":
            pris = 270
        else:
            pris = 350

    return pris

def kjøp_billetter():
    antall_biletter = 9
    teater_navn = "Størst av alt er kjærligheten"
    dato = "2024-02-03"
    tidspunkt = "18:30:00"
    billetter = []


    conn = sqlite3.connect('teater.db')
    cursor = conn.cursor()

    # Henter radnumre og områdenavn som har nok ledige seter.
    cursor.execute('''
        SELECT DISTINCT RadNr, Område
        FROM Billett
        WHERE Dato = ? AND Tidspunkt = ? 
        GROUP BY RadNr, Område
        HAVING COUNT(*) >= ?
    ''', (dato, tidspunkt, antall_biletter))

    rader_områder = cursor.fetchall()

    #Dersom ingen av raden har nok ledige seter vil det bli gitt beskjed. 
    if len(rader_områder) == 0:
        print("Det er ikke nok ledige stoler for denne forestillingen.")
        return [], 0

    for rad_område in rader_områder:
        rad_nr, område = rad_område

        # Henter ledige stoler som er på samme rad, og i samme område. I den gitte forestillingen. 
        cursor.execute('''
            SELECT StolNr
            FROM Billett
            WHERE Dato = ? AND Tidspunkt = ? AND RadNr = ? AND Område = ?
            AND NOT EXISTS (
                SELECT 1 
                FROM BillettKjøp 
                WHERE BillettKjøp.StolNr = Billett.StolNr 
                AND BillettKjøp.RadNr = Billett.RadNr 
                AND BillettKjøp.Område = Billett.Område 
                AND BillettKjøp.ForestillingsDato = Billett.Dato 
                AND BillettKjøp.ForestillingsTidspunkt = Billett.Tidspunkt
            )
        ''', (dato, tidspunkt, rad_nr, område))

        ledige_seter = cursor.fetchall()

        if len(ledige_seter) >= antall_biletter:
            ledige_seter = ledige_seter[:antall_biletter]

            # summerer prisen for alle billettene kunden kjøper. 
            total_pris = sum(setPris(teater_navn, 'Stam Stamkunden') for i in range(antall_biletter))

            # Setter inn kjøpene i BillettKjøp-tabellen
            for stol_nr in ledige_seter:
                pris = setPris(teater_navn, 'Stam Stamkunden')
                cursor.execute('''
                    INSERT INTO BillettKjøp (StolNr, RadNr, Område, ForestillingsDato, ForestillingsTidspunkt, KundeprofilMobilnummer, KjøpsTidspunkt, Pris, KjøpsDato)
                    VALUES (?, ?, ?, ?, ?, ?, TIME('now'), ?, DATE('now'))
                ''', (stol_nr[0], rad_nr, område, dato, tidspunkt, 'Stam Stamkunden', pris))
                billetter.append((stol_nr[0], rad_nr, område, pris))

            # Lagrer endringer i databasen
            conn.commit()
            conn.close()

            # Gir beskjed om hvilke billetter som ble kjøpt og den totale prisen for kjøpet. 
            print("Kjøpte billetter:")
            for billett in billetter:
                print(f"Stolnr: {billett[0]}, Radnr: {billett[1]}, Område: {billett[2]}, Pris: {billett[3]} kr.")

            print(f"Totalpris for {antall_biletter} billetter til {teater_navn} den {dato}: {total_pris} kr.")

            return billetter, total_pris

    print("Det er ikke nok ledige stoler for denne forestillingen.")
    return [], 0


kjøp_billetter()