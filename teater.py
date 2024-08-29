import sqlite3

def opprett_tabeller(database_fil, sql_fil):
    conn = sqlite3.connect(database_fil)
    cursor = conn.cursor()

    # leser, og utfører det som står i sqlfilen: 
    with open(sql_fil, 'r') as file:
        sql_statements = file.read()

    cursor.executescript(sql_statements)


    conn.commit()
    conn.close()


database_fil = 'teater.db'
sql_fil = 'teater.sql'
opprett_tabeller(database_fil, sql_fil)