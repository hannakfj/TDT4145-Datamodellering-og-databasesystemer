INSERT INTO Teatersal VALUES ('Hovedscenen', 516); 
INSERT INTO Teatersal VALUES ('Gamle scene', 332); 
INSERT INTO Teatersal VALUES ('Studioscenen', 150); 
INSERT INTO Teatersal VALUES ('Teaterkjelleren', 60);
INSERT INTO Teatersal VALUES ('Teaterkafeen', 100);



INSERT INTO Teaterstykke VALUES ('Kongsemnene', 'Henrik Ibsen');
INSERT INTO Teaterstykke VALUES ('Størst av alt er kjærligheten', 'Jonas Corell Petersen');


INSERT INTO Forestilling VALUES ('2024-02-01', '19:00:00', 'Hovedscenen', 'Kongsemnene');
INSERT INTO Forestilling VALUES ('2024-02-02', '19:00:00', 'Hovedscenen', 'Kongsemnene');
INSERT INTO Forestilling VALUES ('2024-02-03', '19:00:00', 'Hovedscenen', 'Kongsemnene');
INSERT INTO Forestilling VALUES ('2024-02-05', '19:00:00', 'Hovedscenen', 'Kongsemnene');
INSERT INTO Forestilling VALUES ('2024-02-06', '19:00:00', 'Hovedscenen', 'Kongsemnene');


INSERT INTO Forestilling VALUES ('2024-02-03', '18:30:00', 'Gamle scene', 'Størst av alt er kjærligheten');
INSERT INTO Forestilling VALUES ('2024-02-06', '18:30:00', 'Gamle scene', 'Størst av alt er kjærligheten');
INSERT INTO Forestilling VALUES ('2024-02-07', '18:30:00', 'Gamle scene', 'Størst av alt er kjærligheten');
INSERT INTO Forestilling VALUES ('2024-02-12', '18:30:00', 'Gamle scene', 'Størst av alt er kjærligheten');
INSERT INTO Forestilling VALUES ('2024-02-13', '18:30:00', 'Gamle scene', 'Størst av alt er kjærligheten');
INSERT INTO Forestilling VALUES ('2024-02-14', '18:30:00', 'Gamle scene', 'Størst av alt er kjærligheten');


INSERT INTO Akt VALUES (1, 'Størst av alt er kjærligheten'); 


INSERT INTO Akt VALUES (1, 'Kongsemnene'); 
INSERT INTO Akt VALUES (2, 'Kongsemnene'); 
INSERT INTO Akt VALUES (3, 'Kongsemnene'); 
INSERT INTO Akt VALUES (4, 'Kongsemnene'); 
INSERT INTO Akt VALUES (5, 'Kongsemnene'); 


INSERT INTO Område VALUES ('Parkett', 'Hovedscenen'); 
INSERT INTO Område VALUES ('Galleri', 'Hovedscenen'); 


INSERT INTO Område VALUES ('Galleri', 'Gamle scene'); 
INSERT INTO Område VALUES ('Balkong', 'Gamle scene'); 
INSERT INTO Område VALUES ('Parkett', 'Gamle scene'); 


INSERT INTO Person VALUES ('Arturo Scotti', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Ingunn Beate Strige Øyen', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Hans Petter Nilsen', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Medeleine Brandtzæg Nilsen', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Synnøve Fossum Eriksen', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Emma Caroline Deichmann', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Thomas Jensen Takyi', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Per Bogstad Gulliksen', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Isak Holmen Sørensen', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Fabian Heidelberg Lunde', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Emil Olafsson', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Snorre Ryen Tøndel', null, 0, null, null, null); 

INSERT INTO Person VALUES ('Yury Butusov', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Aleksandr Shishkin-Hokusai', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Evind Myren', null, 0, null, null, null); 
INSERT INTO Person VALUES ('Mina Rype Stokke', null, 0, null, null, null); 


INSERT INTO Rolle VALUES ('Haakon Haakonssønn'); 
INSERT INTO Rolle VALUES ('Inga fra Vartejg (Haakons mor)'); 
INSERT INTO Rolle VALUES ('Skule jarl'); 
INSERT INTO Rolle VALUES ('Fru Ragnhild (Skules hustru)'); 
INSERT INTO Rolle VALUES ('Margrete (Skules datter)'); 
INSERT INTO Rolle VALUES ('Sigrid (Skules søster)'); 
INSERT INTO Rolle VALUES ('Ingebjørg'); 
INSERT INTO Rolle VALUES ('Biskop Nikolas'); 
INSERT INTO Rolle VALUES ('Gregorius Jonssønn'); 
INSERT INTO Rolle VALUES ('Paal Flida'); 
INSERT INTO Rolle VALUES ('Trønder'); 
INSERT INTO Rolle VALUES ('Baard Bratte'); 
INSERT INTO Rolle VALUES ('Jatgeir Skald'); 
INSERT INTO Rolle VALUES ('Dagfinn Bonde'); 
INSERT INTO Rolle VALUES ('Peter (prest og Ingebjørgs sønn)'); 


INSERT INTO SpillesAv VALUES ('Haakon Haakonssønn', 'Arturo Scotti'); 
INSERT INTO SpillesAv VALUES ('Inga fra Vartejg (Haakons mor)', 'Ingunn Beate Strige Øyen'); 
INSERT INTO SpillesAv VALUES ('Skule jarl', 'Hans Petter Nilsen'); 
INSERT INTO SpillesAv VALUES ('Fru Ragnhild (Skules hustru)', 'Medeleine Brandtzæg Nilsen'); 
INSERT INTO SpillesAv VALUES ('Margrete (Skules datter)', 'Synnøve Fossum Eriksen'); 
INSERT INTO SpillesAv VALUES ('Sigrid (Skules søster)', 'Emma Caroline Deichmann'); 
INSERT INTO SpillesAv VALUES ('Ingebjørg', 'Emma Caroline Deichmann'); 
INSERT INTO SpillesAv VALUES ('Biskop Nikolas', 'Thomas Jensen Takyi'); 
INSERT INTO SpillesAv VALUES ('Gregorius Jonssønn', 'Per Bogstad Gulliksen'); 
INSERT INTO SpillesAv VALUES ('Paal Flida', 'Isak Holmen Sørensen'); 
INSERT INTO SpillesAv VALUES ('Trønder', 'Isak Holmen Sørensen'); 
INSERT INTO SpillesAv VALUES ('Baard Bratte', 'Fabian Heidelberg Lunde'); 
INSERT INTO SpillesAv VALUES ('Trønder', 'Fabian Heidelberg Lunde'); 
INSERT INTO SpillesAv VALUES ('Jatgeir Skald', 'Emil Olafsson'); 
INSERT INTO SpillesAv VALUES ('Dagfinn Bonde', 'Emil Olafsson'); 
INSERT INTO SpillesAv VALUES ('Peter (prest og Ingebjørgs sønn)', 'Snorre Ryen Tøndel'); 


INSERT INTO GjørOppgave VALUES('Kongsemnene', 'Yury Butusov', 'Regi'); 
INSERT INTO GjørOppgave VALUES('Kongsemnene', 'Yury Butusov', 'musikkutvelgelse');
INSERT INTO GjørOppgave VALUES('Kongsemnene', 'Aleksandr Shishkin-Hokusai', 'Scenografi');
INSERT INTO GjørOppgave VALUES('Kongsemnene', 'Aleksandr Shishkin-Hokusai', 'kostymer');
INSERT INTO GjørOppgave VALUES('Kongsemnene', 'Evind Myren', 'Lysdesign');
INSERT INTO GjørOppgave VALUES('Kongsemnene', 'Mina Rype Stokke', 'Dramaturg');


INSERT INTO Rolle VALUES ('Sunniva Du Mond Nordal'); 
INSERT INTO Rolle VALUES ('Jo Saberniak'); 
INSERT INTO Rolle VALUES ('Marte M.Steinholt'); 
INSERT INTO Rolle VALUES ('Tor Ivar Hagen'); 


INSERT INTO Person VALUES ('Sunniva Du Mond Nordal', null, 0, null, null, null);
INSERT INTO Person VALUES ('Jo Saberniak', null, 0, null, null, null);
INSERT INTO Person VALUES ('Tor Ivar Hagen', null, 0, null, null, null);
INSERT INTO Person VALUES ('Marte M.Steinholt', null, 0, null, null, null);


INSERT INTO Person VALUES ('Jonas Corell Petersen', null, 0, null, null, null);
INSERT INTO Person VALUES ('Devid Gehrt', null, 0, null, null, null);
INSERT INTO Person VALUES ('Gaute Tønder', null, 0, null, null, null);
INSERT INTO Person VALUES ('Magnus Mikaelsen', null, 0, null, null, null);
INSERT INTO Person VALUES ('Kristoffer Spender', null, 0, null, null, null);


INSERT INTO GjørOppgave VALUES('Størst av alt er kjærligheten', 'Jonas Corell Petersen', 'Regi'); 
INSERT INTO GjørOppgave VALUES('Størst av alt er kjærligheten', 'Devid Gehrt', 'Scenografi'); 
INSERT INTO GjørOppgave VALUES('Størst av alt er kjærligheten', 'Gaute Tønder', 'Musikalsk ansvarlig'); 
INSERT INTO GjørOppgave VALUES('Størst av alt er kjærligheten', 'Magnus Mikaelsen', 'Lysdesign'); 
INSERT INTO GjørOppgave VALUES('Størst av alt er kjærligheten', 'Kristoffer Spender', 'Dramaturg'); 


INSERT INTO SpillesAv VALUES ('Sunniva Du Mond Nordal', 'Sunniva Du Mond Nordal'); 
INSERT INTO SpillesAv VALUES ('Jo Saberniak', 'Jo Saberniak'); 
INSERT INTO SpillesAv VALUES ('Tor Ivar Hagen', 'Tor Ivar Hagen'); 
INSERT INTO SpillesAv VALUES ('Marte M.Steinholt', 'Marte M.Steinholt'); 


INSERT INTO DelAv VALUES ('1', 'Størst av alt er kjærligheten', 'Sunniva Du Mond Nordal'); 
INSERT INTO DelAv VALUES ('1', 'Størst av alt er kjærligheten', 'Jo Saberniak'); 
INSERT INTO DelAv VALUES ('1', 'Størst av alt er kjærligheten', 'Tor Ivar Hagen');
INSERT INTO DelAv VALUES ('1', 'Størst av alt er kjærligheten', 'Marte M.Steinholt'); 

INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Haakon Haakonssønn'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Dagfinn Bonde'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Sigrid (Skules søster)');
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Skule jarl'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Inga fra Vartejg (Haakons mor)'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Paal Flida');
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Fru Ragnhild (Skules hustru)'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Gregorius Jonssønn'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Margrete (Skules datter)');
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Biskop Nikolas'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Baard Bratte'); 
INSERT INTO DelAv VALUES ('1', 'Kongsemnene', 'Trønder'); 


INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Haakon Haakonssønn'); 
INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Dagfinn Bonde'); 
INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Sigrid (Skules søster)');
INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Skule jarl');  
INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Paal Flida');
INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Gregorius Jonssønn'); 
INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Margrete (Skules datter)');
INSERT INTO DelAv VALUES ('2', 'Kongsemnene', 'Biskop Nikolas'); 

INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Haakon Haakonssønn'); 
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Dagfinn Bonde'); 
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Skule jarl');
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Inga fra Vartejg (Haakons mor)'); 
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Paal Flida');
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Gregorius Jonssønn'); 
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Margrete (Skules datter)');
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Biskop Nikolas'); 
INSERT INTO DelAv VALUES ('3', 'Kongsemnene', 'Peter (prest og Ingebjørgs sønn)');

INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Haakon Haakonssønn'); 
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Dagfinn Bonde'); 
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Ingebjørg'); 
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Jatgeir Skald'); 
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Skule jarl');
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Paal Flida');
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Gregorius Jonssønn'); 
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Margrete (Skules datter)');
INSERT INTO DelAv VALUES ('4', 'Kongsemnene', 'Peter (prest og Ingebjørgs sønn)');


INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Haakon Haakonssønn'); 
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Dagfinn Bonde'); 
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Sigrid (Skules søster)'); 
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Skule jarl'); 
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Paal Flida');
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Fru Ragnhild (Skules hustru)');
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Gregorius Jonssønn');
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Margrete (Skules datter)');
INSERT INTO DelAv VALUES ('5', 'Kongsemnene', 'Peter (prest og Ingebjørgs sønn)');


