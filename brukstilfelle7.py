#Tar inn navnet til en skuespiller
#Joiner med DelAv tabellen (og kaller denne rolle) slik at man finner rollenavnet til den skuespilleren man skal sjekke for (siden det er i DelAv man finner aktnummer)
#Joiner med DelAv igjen og kaller den motspiller. Her joiner man på samme aktnummer og samme teaterstykkenavn. 
#Joiner igjen på SpillesAv for å finne skuespillernavnet på rollen man fant som spiller i samme akt som den man sjekker for. 
#WHERE viser at inputen er navnet til en skuespiller og at man ikke skal ta med navnet på den man sjekker for i resultatet. 


import sqlite3

def skuespillere_spilt_sammen(): 

    #Input verdi for skuespillernavn man vil sjekke
    navn_skuespiller = input("Skriv inn navnet på skuespilleren du vil sjekke: ")

    #Kobler til databasen 
    conn = sqlite3.connect("teater.db")
    cursor = conn.cursor()

    cursor.execute('''
    SELECT DISTINCT motspillerNavn.Navn, rolle.TeaterstykkeNavn
    FROM SpillesAv AS skuespillerSjekk
    JOIN DelAv AS rolle ON skuespillerSjekk.RolleNavn = rolle.RolleNavn 
    JOIN DelAv AS motspiller ON rolle.AktNummer = motspiller.AktNummer AND rolle.TeaterstykkeNavn = motspiller.TeaterstykkeNavn
    JOIN SpillesAv AS motspillerNavn ON motspiller.RolleNavn = motspillerNavn.RolleNavn 
    WHERE skuespillerSjekk.Navn = ? AND skuespillerSjekk.Navn != motspillerNavn.Navn;  
    '''
    , (navn_skuespiller,))

    fant_motspiller = cursor.fetchall()
    conn.close()


    #Sjekker om fant noen og printer skuespillerne den spiller med
    if fant_motspiller: 
        print(f"Skuespillere som har spilt i samme akt som {navn_skuespiller} er: ")
        for skuespillere in fant_motspiller: 
            print(f"{skuespillere[0]} i {skuespillere[1]}.")
    else: 
        print(f"Fant ingen skuespillere som har spilt sammen med {navn_skuespiller}.")

  
skuespillere_spilt_sammen()














