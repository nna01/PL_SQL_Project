clear screen;

set serveroutput on;
set verify off;

declare
	rin recipient.rid%TYPE := '&RID';	
	RID recipient.rid%TYPE; 
	Rname recipient.rname%type;
	Rage recipient.rage%type; 
	Rgender recipient.rgender%type;
	Rbloodgroup recipient.rbloodgroup%type; 
	Raddress recipient.raddress%type; 
	Rphonenum recipient.rphonenum%type; 
	DID donor.did%type;
	dname donor.dname%type;
	givendate donation_details.givenat%type;
	hospital donation_details.hospital%type;
	amount donation_details.amount%type;
	
	cursor recipientbyid(matchrid recipient.rid%TYPE) is
	select rid,rname,rage,rgender,rbloodgroup,raddress,rphonenum,did,dname,givenat,hospital,amount from recipient
	join (donation_details join donor on donation_details.did = donor.did) on donor.did = recipient.did
	where rin = matchrid;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('Recipient ID'||' -- '||' Recipient Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group' ||' -- '||
	'Address' ||' -- '|| 'Phone Number' ||' -- '|| 'Donor ID' ||' -- '|| 'Donor Name' ||' -- '|| 'Given Date' ||' -- '|| 'Hospital'||' -- '|| 'Amount');
	
	open recipientbyid(rin);
	
		fetch recipientbyid into rid,rname,rage,rgender,rbloodgroup,raddress,rphonenum,did,dname,givendate,hospital,amount;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(rid)||' -- '|| rname ||' -- '|| TO_CHAR(rage)||' -- '|| rgender||' -- '|| rbloodgroup||' -- '|| raddress ||
		' -- '||rphonenum || ' -- ' || did|| ' -- ' || dname|| ' -- ' || givendate || ' -- ' || hospital|| ' -- ' || amount);
		
	close recipientbyid;
	

end;
/