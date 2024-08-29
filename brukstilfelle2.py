import sqlite3


database_fil = 'teater.db'
sql_fil = 'Test_Customer.sql'


#leser filen med oversikt over alle stolene
with open('gamle-scene.txt', 'r') as file:
    lines = file.readlines()
#definerer områdenavnene til gamle scenen
omradenavn = ['Galleri', 'Balkong', 'Parkett']

kunde_navn = 'Stam Stamkunden'

#lager en funksjon som setterprisen avhengig av teaterstykket, og gruppetypen til kunden. Dersom gruppen ikke finnes i teaterstykket blir prisen satt til ordinær.
def setPris(Teater_Navn, navn):
    pris = None
    gruppe = None

    # Henter gruppen til kunden basert på navnet
    with sqlite3.connect(database_fil) as conn:
        cursor = conn.cursor()
        cursor.execute(f"SELECT GruppeType FROM Kundeprofil WHERE Navn = '{navn}'")
        row = cursor.fetchone()
        if row:
            gruppe = row[0]


    # Setter prisen basert på teaterstykkenavnet og kundens gruppe
    if Teater_Navn == "Kongsemnene":
        if gruppe == "Ordinær":
            pris = 450
        elif gruppe == "Honnør":
            pris = 380
        elif gruppe == "Student":
            pris = 280
        elif gruppe == "Gruppe 10":
            pris = 420
        elif gruppe == "Gruppe honnør 10":
            pris = 360
        else:
            pris = 450

    elif Teater_Navn == "Størst av alt er kjærligheten":
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




# Setter inn entiteter i BillettKjøptabellen. For kjøp gjort til forestillingen i gamle scenen.
def generate_sql_gamle_scene(lines, omradenavn):
    sql_insertions_purchase = []
    naa_omrade = None
    naa_rad_nr = 1  
    for line in lines:
        line = line.strip()
        if line in omradenavn:
            naa_omrade = line
            naa_rad_nr = 1 
        else:
            for rad_nr, row in enumerate(line.split('\n'), start=naa_rad_nr):
                naa_rad_nr = rad_nr + 1
                for stol_nr, bit in enumerate(row):
                    if bit == '1':#legger inn kjøp for alle stolene med bit 1
                        # henter ut telefonnummer til kunden
                        # setter prisen for kjøpet
                        pris = setPris("Størst av alt er kjærligheten", kunde_navn)
                        sql_insertions_purchase.append(f"INSERT INTO BillettKjøp (StolNr, RadNr, Område, ForestillingsDato, ForestillingsTidspunkt, KundeprofilMobilnummer, KjøpsTidspunkt, Pris, KjøpsDato) VALUES ({stol_nr + 1}, {rad_nr}, '{naa_omrade}', '2024-02-03', '18:30:00', (SELECT Mobilnummer FROM Kundeprofil WHERE Navn = '{kunde_navn}'), TIME('now'), {pris}, DATE('now'));")
    return sql_insertions_purchase

sql_insertions_purchase = generate_sql_gamle_scene(lines, omradenavn)

#lager en sql fil med alle innsettingene
with open('innsett_kjøp_gamlescene.sql', 'w') as sql_file:
    for sql_insertion in sql_insertions_purchase: 
        sql_file.write(sql_insertion + '\n')  


with open('hovedscenen.txt', 'r') as file:
    lines = file.readlines()

omradenavn = ['Galleri', 'Parkett']


# Setter inn entiteter i BillettKjøptabellen. For kjøp gjort til forestillingen på hovedscenen.
def generate_sql_hovedscenen_purchase(lines, omradenavn):
    sql_insertions = []
    naa_omrade = None
    naa_rad_nr = 1  
    for line in lines:
        line = line.strip()
        if 'Dato' in line: 
            continue
        elif line in omradenavn:
            naa_omrade = line
            naa_rad_nr = 1  
        else:
            for rad_nr, row in enumerate(line.split('\n'), start=naa_rad_nr):
                naa_rad_nr = rad_nr + 1
                for stol_nr, bit in enumerate(row):
                    if bit == '1': #legger inn kjøp for alle stolene med bit 1
                        pris = setPris("Kongsemnene", kunde_navn)
                        sql_insertions.append(f"INSERT INTO BillettKjøp (StolNr, RadNr, Område, ForestillingsDato, ForestillingsTidspunkt, KundeprofilMobilnummer, KjøpsTidspunkt, Pris, KjøpsDato) VALUES ({stol_nr + 1}, {rad_nr}, '{naa_omrade}', '2024-02-03', '19:00:00', (SELECT Mobilnummer FROM Kundeprofil WHERE Navn = '{kunde_navn}'), Time('now'), {pris}, DATE('now'));")
    return sql_insertions

sql_insertions = generate_sql_hovedscenen_purchase(lines, omradenavn)

#lager en sql fil med alle innsettingene
with open('innsett_kjøp_hovedscene.sql','w') as sql_file:
    for sql_insertion in sql_insertions:
        sql_file.write(sql_insertion + '\n')




