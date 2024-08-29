SELECT DISTINCT Teaterstykke.Navn, SpillesAv.Navn, DelAv.RolleNavn
FROM SpillesAv 
JOIN DelAv ON SpillesAv.RolleNavn = DelAv.RolleNavn
JOIN Teaterstykke ON DelAv.TeaterstykkeNavn = Teaterstykke.Navn
ORDER BY Teaterstykke.Navn, SpillesAv.Navn; 



