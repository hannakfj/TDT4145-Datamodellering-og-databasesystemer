# denne filen leser gamle-scene.txt og hovedscenen.txt, 
# og lager to sql-filer for innsetting av stol- og billettentiteter til databasen. 

with open('gamle-scene.txt', 'r') as file:
    lines = file.readlines()

omradenavn = ['Galleri', 'Balkong', 'Parkett']

# Har en funskjon for hver scene til insetting av stolene
def generate_sql_gamle_scene(lines, omradenavn):
    sql_innsettinger = []
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
                    if bit != 'x':  # Ignorerer stolene merket med 'x'
                        sql_innsettinger.append(f"INSERT INTO Stol (StolNr, RadNr, Områdenavn, Teatersal) VALUES ({stol_nr + 1}, {rad_nr}, '{naa_omrade}', 'gamle scene');")
                        sql_innsettinger.append(f"INSERT INTO Billett (StolNr, RadNr, Område, Dato, Tidspunkt) VALUES ({stol_nr + 1}, {rad_nr}, '{naa_omrade}', '2024-02-03', '18:30:00');")
    return sql_innsettinger

sql_innsettinger = generate_sql_gamle_scene(lines, omradenavn)


with open('innsett_stoler_billetter_gamlescene.sql', 'w') as sql_file:
    for sql_innsetting in sql_innsettinger:
        sql_file.write(sql_innsetting + '\n')



with open('hovedscenen.txt', 'r') as file:
    lines = file.readlines()


omradenavn = ['Galleri', 'Parkett']


def generate_sql_hovedscenen(lines, omradenavn):
    sql_innsettinger = []
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
                    if bit != 'x':  # Ignorerer stolene merket med 'x'
                        sql_innsettinger.append(f"INSERT INTO Stol (StolNr, RadNr, Områdenavn, Teatersal) VALUES ({stol_nr + 1}, {rad_nr}, '{naa_omrade}', 'Hovedscene');")
                        sql_innsettinger.append(f"INSERT INTO Billett (StolNr, RadNr, Område, Dato, Tidspunkt) VALUES ({stol_nr + 1}, {rad_nr}, '{naa_omrade}', '2024-02-03', '19:00:00');")
    return sql_innsettinger


sql_innsettinger = generate_sql_hovedscenen(lines, omradenavn)


with open('innsett_stoler_billetter_hovedscene.sql', 'w') as sql_file:
    for sql_innsetting in sql_innsettinger:
        sql_file.write(sql_innsetting + '\n')