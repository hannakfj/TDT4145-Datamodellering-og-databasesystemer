DROP TABLE IF EXISTS Person;  
CREATE TABLE Person (
    Navn varchar(50),
    Epost varchar(50) UNIQUE,
    ErDirektør BIT,
    Telefon INTEGER UNIQUE,
    Adresse varchar(50),
    Ansattstatus varchar(50),
    PRIMARY KEY (Navn)
);

DROP TABLE IF EXISTS Teaterstykke;  
CREATE TABLE Teaterstykke(
    Navn varchar(50),
    Forfatter varchar(50),
    PRIMARY KEY (Navn)
); 

DROP TABLE IF EXISTS Teatersal;  
CREATE TABLE Teatersal(
    Navn varchar(50), 
    AntallPlasser INTEGER,
    PRIMARY KEY (Navn)
); 

DROP TABLE IF EXISTS Rolle;  
CREATE TABLE Rolle(
    Navn varchar(50),
    PRIMARY KEY (Navn)
); 

DROP TABLE IF EXISTS DelAv;  
CREATE TABLE DelAv(
    AktNummer INTEGER, 
    TeaterstykkeNavn varchar(50), 
    RolleNavn varchar(50),
    FOREIGN KEY (AktNummer) REFERENCES Akt(Nummer) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RolleNavn) REFERENCES Rolle(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (RolleNavn, AktNummer, TeaterstykkeNavn)
);

DROP TABLE IF EXISTS Akt;  
CREATE TABLE Akt(
    Nummer INTEGER, 
    TeaterstykkeNavn varchar(50),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Nummer, TeaterstykkeNavn)
);

DROP TABLE IF EXISTS GjørOppgave;  
CREATE TABLE GjørOppgave (
    TeaterstykkeNavn varchar(50),
    Navn varchar(50),
    TypeOppgave varchar(50),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Navn) REFERENCES Person(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (TeaterstykkeNavn, Navn, TypeOppgave)
);


DROP TABLE IF EXISTS Område;  
CREATE TABLE Område (
    Navn varchar(50),
    TeatersalNavn varchar(50),
    FOREIGN KEY (TeatersalNavn) REFERENCES Teatersal(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Navn, TeatersalNavn)
);

DROP TABLE IF EXISTS Stol;  
CREATE TABLE Stol (
    StolNr INTEGER,
    RadNr INTEGER,
    Områdenavn varchar(50),
    Teatersal varchar(50),
    FOREIGN KEY (Områdenavn) REFERENCES Område(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Teatersal) REFERENCES Teatersal(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (StolNr, RadNr, Områdenavn, Teatersal)
);

DROP TABLE IF EXISTS Kundeprofil;  
CREATE TABLE Kundeprofil (
    Mobilnummer INTEGER,
    Navn varchar(50),
    Adresse varchar(50),
    GruppeType varchar(50),
    FOREIGN KEY (GruppeType) REFERENCES Gruppe(GruppeType) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (Mobilnummer)
);

DROP TABLE IF EXISTS Gruppe;  
CREATE TABLE Gruppe (
    GruppeType varchar(50),
    PRIMARY KEY (GruppeType)
);

DROP TABLE IF EXISTS HarGruppe;  
CREATE TABLE HarGruppe (
    TeaterstykkeNavn varchar(50),
    GruppeType varchar(50),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GruppeType) REFERENCES Gruppe(GruppeType) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (TeaterstykkeNavn, GruppeType)
);

DROP TABLE IF EXISTS Billett;  
CREATE TABLE Billett (
    StolNr INTEGER, 
    RadNr INTEGER,
    Område varchar(50),
    Dato DATE,
    Tidspunkt TIME,
    FOREIGN KEY (Tidspunkt, Dato) REFERENCES Forestilling(Tidspunkt, Dato) ON DELETE CASCADE ON UPDATE CASCADE,    
    PRIMARY KEY (Tidspunkt, Dato, StolNr, RadNr, Område)

); 

DROP TABLE IF EXISTS Forestilling;  
CREATE TABLE Forestilling(
    Dato DATE,
    Tidspunkt TIME,
    TeatersalNavn varchar(50), 
    TeaterstykkeNavn varchar(50), 
    FOREIGN KEY (TeatersalNavn) REFERENCES Teatersal(Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Dato, Tidspunkt)
);

DROP TABLE IF EXISTS DelAv;  
CREATE TABLE DelAv(
    AktNummer INTEGER, 
    TeaterstykkeNavn varchar(50),
    RolleNavn varchar(50),
    FOREIGN KEY (AktNummer, TeaterstykkeNavn) REFERENCES Akt(Nummer, TeaterstykkeNavn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RolleNavn) REFERENCES Rolle (Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (AktNummer, TeaterstykkeNavn, RolleNavn)
);

DROP TABLE IF EXISTS SpillesAv;  
CREATE TABLE SpillesAv(
    RolleNavn varchar(50), 
    Navn INTEGER,
    FOREIGN KEY (RolleNavn) REFERENCES Rolle(Navn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Navn) REFERENCES Person(Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (RolleNavn, Navn)
);


DROP TABLE IF EXISTS BillettKjøp;  
CREATE TABLE BillettKjøp (
    StolNr INTEGER,
    RadNr INTEGER,
    Område varchar(50),
    ForestillingsDato DATE,
    ForestillingsTidspunkt TIME,
    KundeprofilMobilnummer INTEGER,
    KjøpsTidspunkt TIME,
    Pris INTEGER,
    KjøpsDato DATE,
    FOREIGN KEY (Område, RadNr, StolNr) REFERENCES Billett(Område, RadNr, StolNr) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ForestillingsDato,ForestillingsTidspunkt ) REFERENCES Forestilling(Dato, Tidspunkt)ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (KundeprofilMobilnummer) REFERENCES Kundeprofil(Mobilnummer)ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (Område, RadNr, StolNr, ForestillingsDato, ForestillingsTidspunkt, KundeprofilMobilnummer)
);