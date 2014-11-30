DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS MenAthletes;
DROP TABLE IF EXISTS WomenAthletes;
DROP TABLE IF EXISTS DayAndTime;
DROP TABLE IF EXISTS Sports;
DROP TABLE IF EXISTS MenAthleteSports;
DROP TABLE IF EXISTS WomenAthleteSports;
DROP TABLE IF EXISTS Stadiums;
DROP TABLE IF EXISTS SportStadium;
DROP VIEW IF EXISTS athleteName;
DROP VIEW IF EXISTS SoccerTime;

-- People --
CREATE TABLE People(
pid char(4) not null,
firstName varchar(30) not null,
lastName varchar(30) not null,
country varchar(30),
primary key (pid)
);

-- DayAndTime --
CREATE TABLE DayAndTime (
  did      char(4) not null,
  DateOfEvent   date,
  TimeOfEventGMT time,
 primary key(did)
);

-- MenAthletes --
CREATE TABLE MenAthletes (
  maid char(4) references People(pid),
  did     char(4) not null references DayAndTime(did),
  weightPounds int,
  heightInches int,
  primary key(maid),
  unique (maid)
);     
   
-- WomenAthletes --
CREATE TABLE WomenAthletes (
  waid    char(4) references People(pid),
  did     char(4) not null references DayAndTime(did),
  weightPounds   int,
  heightInches   int,
  primary key(waid),
  unique (waid)
);    

-- Sports -- 
CREATE TABLE Sports (
  sid     char(4) not null,    
  nameOfSport   text,
  primary key(sid)
);

--MenAthleteSports--
CREATE TABLE MenAthleteSports (
  maid char(4) references MenAthletes(maid),
  sid char(4) references Sports(sid),
  primary key (maid, sid),
  unique (maid)
);

-- WomenAthleteSports --
CREATE TABLE WomenAthleteSports (
  waid char(4) references WomenAthletes(waid),
  sid char(4) references Sports(sid),
  primary key (waid, sid), 
  unique (waid)
);

-- Stadiums -- 
CREATE TABLE Stadiums (
  stid     char(4) not null,    
  did     char(4) not null references DayAndTime(did),
  nameOfStadium   varchar(120),
  Location  varchar(120),
  primary key(stid),
  unique (stid)
);

-- SportStadium --
CREATE TABLE SportStadium (
  stid char(4) references Stadiums(stid),
  sid char(4) references Sports(sid),
  primary key (stid, sid) 
);


-- People --
INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p001', 'Theo', 'Walcot', 'Kenya');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p002', 'Peter', 'Barkley', 'England');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p003', 'Jenn', 'Dephna', 'Crotia');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p004', 'Luiz', 'Suarez', 'Uraguy');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p005', 'Linda', 'Smith', 'England');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p006', 'Mary', 'Fisher', 'Denmark');
  
INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p007', 'Ronald', 'Dartey', 'Ghana');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p008', 'Kevin', 'Krapah', 'Ghana');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p009', 'Kristie', 'Blake', 'Jamaica');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p010', 'Recardo', 'Kaka', 'Brazil');
  
INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p011', 'Park', 'Song', 'Japan');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p012', 'Mehdi', 'Owdji', 'Iran');

INSERT INTO People( pid, firstName ,lastName, country)
  VALUES('p013', 'Elsie', 'Brown', 'Netherland');

-- DayAndTIme --
INSERT INTO DayAndTime( did, DateOfEvent, TimeOfEventGMT)
  VALUES('d001', '06/07/2014', '13:05');

INSERT INTO DayAndTime( did, DateOfEvent, TimeOfEventGMT)
  VALUES('d002', '06/07/2014', '18:05');
  
INSERT INTO DayAndTime( did, DateOfEvent, TimeOfEventGMT)
  VALUES('d003', '06/08/2014', '14:05');
  
INSERT INTO DayAndTime( did, DateOfEvent, TimeOfEventGMT)
  VALUES('d004', '06/08/2014', '20:45');

INSERT INTO DayAndTime( did, DateOfEvent, TimeOfEventGMT)
  VALUES('d005', '06/09/2014', '12:30');

INSERT INTO DayAndTime( did, DateOfEvent, TimeOfEventGMT)
  VALUES('d006', '06/09/2014', '19:05');
  
INSERT INTO DayAndTime( did, DateOfEvent, TimeOfEventGMT)
  VALUES('d007', '06/10/2014', '20:05');

-- MenAthletes --
INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p001', 'd001', 75, 185);

INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p002', 'd001', 75, 185);

INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p004', 'd002', 72, 191);

INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p007', 'd002', 77, 181);

INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p008', 'd003', 73, 178);

INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p010', 'd004', 69, 175);

INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p011', 'd005', 75, 189);

INSERT INTO MenAthletes( maid, did, weightPounds, heightInches)
  VALUES('p012', 'd005', 71, 185);

-- WomenAthletes --
INSERT INTO WomenAthletes( waid, did, weightPounds, heightInches)
  VALUES('p003', 'd001', 69, 169);

INSERT INTO WomenAthletes( waid, did, weightPounds, heightInches)
  VALUES('p005', 'd002', 70, 171);

INSERT INTO WomenAthletes( waid, did, weightPounds, heightInches)
  VALUES('p006', 'd006', 67, 169);

INSERT INTO WomenAthletes( waid, did, weightPounds, heightInches)
  VALUES('p009', 'd006', 70, 177);

INSERT INTO WomenAthletes( waid, did, weightPounds, heightInches)
  VALUES('p013', 'd007', 73, 173);


-- Sports --
INSERT INTO Sports(sid, nameOfSport)
  VALUES('s001', 'Soccer');

INSERT INTO Sports(sid, nameOfSport)
  VALUES('s002', 'Swimming');
  
INSERT INTO Sports(sid, nameOfSport)
  VALUES('s003', 'Boxing');

INSERT INTO Sports(sid, nameOfSport)
  VALUES('s004', 'Hockey');

INSERT INTO Sports(sid, nameOfSport)
  VALUES('s005', 'Handball');

INSERT INTO Sports(sid, nameOfSport)
  VALUES('s006', 'Volleyball');
  
--MenAthleteSports--
INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p001', 's001');

INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p002', 's002');

INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p004', 's001');

INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p007', 's002');

INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p008', 's003');

INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p010', 's004');

INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p011', 's005');

INSERT INTO MenAthleteSports(maid, sid) 
VALUES('p012', 's005');


--WomenAthleteSports--
INSERT INTO WomenAthleteSports(waid, sid) 
VALUES('p003', 's002');

INSERT INTO WomenAthleteSports(waid, sid) 
VALUES('p005', 's003');

INSERT INTO WomenAthleteSports(waid, sid) 
VALUES('p006', 's004');

INSERT INTO WomenAthleteSports(waid, sid) 
VALUES('p009', 's006');

INSERT INTO WomenAthleteSports(waid, sid) 
VALUES('p013', 's006');


-- Stadium --
INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st01', 'd001', 'Emirites Stadium', '329 St, Madrid');

INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st02', 'd001', 'White Atlain', '214 St, Madrid');

INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st03', 'd002', 'Craven Cott', '431 St, Madrid');

INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st04', 'd002', 'White Atlain', '214 St, Madrid');

INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st05', 'd003', 'Stamford Stadium', '121 St, Madrid');
  
INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st06', 'd004', 'Expreto Stadium', '329 St, Madrid');

INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st07', 'd005', 'Craven Cott', '431 St, Madrid');

INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st08', 'd006', 'Craven Cott', '431 St, Madrid');

INSERT INTO Stadiums( stid, did, nameOfStadium, Location)
  VALUES('st09', 'd007', 'Emirites Stadium', '329 St, Madrid');

 
 --SportStadium--
INSERT INTO SportStadium(stid, sid) 
VALUES('st01', 's001');

INSERT INTO SportStadium(stid, sid) 
VALUES('st02', 's001');

INSERT INTO SportStadium(stid, sid) 
VALUES('st03', 's001');

INSERT INTO SportStadium(stid, sid) 
VALUES('st04', 's002');

INSERT INTO SportStadium(stid, sid) 
VALUES('st05', 's003');

INSERT INTO SportStadium(stid, sid) 
VALUES('st06', 's004');

INSERT INTO SportStadium(stid, sid) 
VALUES('st07', 's005');

INSERT INTO SportStadium(stid, sid) 
VALUES('st08', 's006');

INSERT INTO SportStadium(stid, sid) 
VALUES('st09', 's006');


select p.lastName, m.heightInches
from menAthletes m,
	People p
where p.pid = m.maid

select * 
from DayAndTime

select * 
from MenAthleteSports

select *
from WomenAthleteSports

Select *
from SportStadium

select * 
from People

--Get the first and last name of MenAthletes who have a game on 2014-06-08--
select p.firstName, p.lastName
from People p
where p.pid in ( select maid
		 from MenAthletes
		 where did in ( select did 
				from DayAndTime
				where dateOfEvent = '2014-06-08')
				)


--view 1--
create view athleteName AS
	select distinct firstName, lastName
	from People p,
		MenAthletes ma,
		WomenAthletes wa
	where p.pid = ma.maid
	or p.pid = wa.waid

select *
from athleteName

--view 2--
create view SoccerTime AS
	select distinct d.dateOfEvent, d.timeOfEventGMT
	from DayAndTime d,
		Stadiums st,
		SportStadium sp,
		Sports s
	where d.did = st.did
	and st.stid = sp.stid
	and sp.sid = s.sid
	and s.nameOfSport = 'Soccer'

select *
from SoccerTime

--triggers--
create or replace function dateTest()
  returns trigger as 
$BODY$
declare
    account_type varchar;
begin
     IF (NEW.DateOfEvent > '2014-06-10') then
	raise NOTICE 'WARNING : There are no events on this day %' , NEW.DateOfEvent;
	end if;
    return null;
end;
$BODY$
  language plpgsql volatile
  cost 100;
alter function dateTest()
  owner to postgres;

create trigger dateTestTrigger
after insert or update
on DayAndTime
for each row
execute procedure dateTest();

DROP TRIGGER IF EXISTS dateTestTrigger on DayAndTime;

--Stored Procedure--

create or replace function athletesOfStadium(varchar(120), REFCURSOR) returns refcursor as 
$$
declare
   nameOfStadium varchar(120)   := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select p.firstName, p.lastName
      from   People p,
		MenAthletes ma
      where p.pid = ma.maid
      and ma.maid in (select mt.maid
		       from MenAthleteSports mt
		       where mt.sid in (select s.sid
					from Sports s
					where s.sid in (select sp.sid
							from SportStadium sp
							where sp.stid in (select st.stid
									  from Stadiums st
									  where st.nameOfStadium = nameOfStadium))));
					
   return resultset;
end;
$$ 
language plpgsql;

select athletesOfStadium('Emirites Stadium', 'results');
Fetch all from results;

--security--
--Women Athletes--
grant insert on WomenAthletes to WomenAthleteSports;
revoke WomenAthletes from DayAndTime

--MenAthletes--
grant insert on MenAthletes to MenAthleteSports;
revoke MenAthletes from DayAndTime

--Database Administrator--
grant all privileges on all tables in schema public to bdAdministrator;

