/*
Vi ønsker å lage et query i SQL som finner hvilke forestillinger som har solgt
best. Skriv ut navn på forestilling og dato og antall solgte plasser sortert på
antall plasser i synkende rekkefølge.
*/

SELECT
  Forestilling.TeaterstykkeNavn,
  Forestilling.Dato,
  COUNT(DISTINCT (BK.StolNr || BK.RadNr || BK.Område)) AS AntallSolgteBilletter
FROM
  Forestilling
JOIN
  BillettKjøp BK
  ON Forestilling.Dato = BK.ForestillingsDato
  AND Forestilling.Tidspunkt = BK.ForestillingsTidspunkt
GROUP BY 
    Forestilling.TeaterstykkeNavn,
    Forestilling.Dato
ORDER BY 
    AntallSolgteBilletter DESC;