set serveroutput on

@@BloodBankTable.sql
@@insertTrigger.sql;
@@updateTrigger.sql;
@@deleteTrigger.sql;
@@countBagofBloodfunction.sql;
@@eligibilitiProc.sql;


SET SERVEROUTPUT ON;
SET VERIFY OFF;

	
ACCEPT x NUMBER PROMPT 'Enter Option: ';


DECLARE
   
	x number := &x;	
	
	--variable for search 
	bg DONOR.Dbloodgroup%TYPE;	
	id DONOR.DID%TYPE;
	
	--variables for insertDonor and search
	
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	area DONOR.Darea%TYPE;
	address DONOR.Daddress%TYPE;
	phonenum DONOR.Dphonenum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	
	--variables for updateDonor
	id1 DONOR.DID%TYPE;
	id2 DONOR.DID%TYPE;
	
	-- variable for search option
	opt number;
	
	-- variable for countBag
	res number;
	
	-- variable for eligibilitiProc
	givenDate DONATION_DETAILS.givenat%TYPE;
	
	-- declare exception
	wrong_value exception;
	
	--cursor 1
	cursor donorbygroup(matchGrp DONOR.Dbloodgroup%TYPE) is
	select * from DONOR
	where Dbloodgroup = matchGrp;
	
	--variable for ID search
	searchID DONOR.darea%TYPE;	
	amount donation_details.amount%Type;
	rname recipient.rname%type;
	rarea recipient.raddress%type;
	hospital donation_details.hospital%type;
	
	--variable for area search
	searchArea DONOR.darea%TYPE;

   --variables for searching eligibility
	inArea DONOR.darea%TYPE;
	eligible donor.deligibility%type;
	
	--variables for SearchRecipient
	rin recipient.rid%TYPE;	
	R_ID recipient.rid%TYPE; 
	R_name recipient.rname%type;
	R_age recipient.rage%type; 
	R_gender recipient.rgender%type;
	R_bloodgroup recipient.rbloodgroup%type; 
	R_address recipient.raddress%type; 
	R_phonenum recipient.rphonenum%type; 
	D_ID donor.did%type;
	D_name donor.dname%type;
	
	--cursor 2
	cursor donorbyID(matchID DONOR.Did%TYPE) is
	select did,dname,dbloodgroup,darea,dphonenum,deligibility,amount,rname, raddress,hospital from donor join (donation_details join recipient on donation_details.did = recipient.did)
	on donor.did = recipient.did
	where Did = matchid;
	
	--cursor 3
	cursor donorbyarea(matchArea DONOR.Darea%TYPE) is
	select * from DONOR
	where Darea = matchArea;
	
	--cursor 4
	cursor donorbyeligibility(matchArea DONOR.Darea%TYPE, elg donor.Deligibility%type) is
	select * from DONOR
	where Darea = matchArea and Deligibility = elg;
	
	--cursor 5
	cursor recipientbyid(matchrid recipient.rid%TYPE) is
	select rid,rname,rage,rgender,rbloodgroup,raddress,rphonenum,did,dname,givenat,hospital,amount from recipient
	join (donation_details join donor on donation_details.did = donor.did) on donor.did = recipient.did
	where rid = matchrid;

BEGIN
	
	IF x = 1 then
		dbms_output.put_line('Search Data');
		dbms_output.put_line(' ');
		@@searchFile.sql;
	elsif x = 2 then
		dbms_output.put_line('Insert Data');
		@@insertFile.sql;
	elsif x = 3 then
		dbms_output.put_line('Update Data');
		@@updateDonor.sql;
	elsif x = 4 then
		dbms_output.put_line('Delete Data ');
		@@deleteDonor.sql;
	else
		raise wrong_value;
	END IF;	
	
exception

	when wrong_value then
		dbms_output.put_line('You have pressed a wrong digit!');

END;
/

