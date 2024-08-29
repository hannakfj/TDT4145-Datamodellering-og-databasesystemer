import sqlite3

# Kobler til databasen
conn = sqlite3.connect('teater.db')
cursor = conn.cursor()

# Funksjon for å finne forestillinger og antall solgte billetter for en gitt dato
def finn_forestillinger(dato):
    # Henter forestillinger og antall solgte billetter
    cursor.execute('''
        SELECT F.TeaterstykkeNavn, F.Tidspunkt, COUNT(B.StolNr)
        FROM Forestilling F LEFT JOIN BillettKjøp B
        ON F.Dato = B.ForestillingsDato AND F.Tidspunkt = B.ForestillingsTidspunkt
        WHERE F.Dato = ?
        GROUP BY F.Dato, F.Tidspunkt
    ''', (dato,))
    
    resultater = cursor.fetchall()
    
    # Skriver ut resultatene
    print("Forestilling\t\t\tTidspunkt\tAntall solgte billetter")
    print("--------------------------------------------------------")
    for rad in resultater:
        print(f"{rad[0]}\t{rad[1]}\t{rad[2]}")

# Tar inn datoen fra brukeren
dato = input("Skriv inn datoen (åååå-mm-dd): ")

finn_forestillinger(dato)

conn.close()
