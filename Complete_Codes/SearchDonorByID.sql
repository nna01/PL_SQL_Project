clear screen;

set serveroutput on;
set verify off;

declare
	searchID DONOR.darea%TYPE := '&ID';	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	area DONOR.Darea%TYPE;
	phonenum DONOR.Dphonenum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	amount donation_details.amount%Type;
	rname recipient.rname%type;
	rarea recipient.raddress%type;
	hospital donation_details.hospital%type;
	
	cursor donorbyID(matchID DONOR.Did%TYPE) is
	select did,dname,dbloodgroup,darea,dphonenum,deligibility,amount,rname, raddress,hospital from donor join (donation_details join recipient on donation_details.did = recipient.did)
	on donor.did = recipient.did
	where Did = matchid;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Donor Name'||' -- ' || ' -- '|| 'Blood Group'||' -- '|| 'Donor Area' ||' -- '|| 
	' -- '|| 'Donor Phone Number' ||' -- '|| 'Donor Eligibility' ||' -- ' || 'Amount' ||' -- ' || 'Recipient Name' ||' -- ' || 'Recipient address' ||' -- ' || 'Hospital');
	
	open donorbyid(searchID);
	loop
		fetch donorbyid into id,name,bloodGrp,area,phonenum,elgib,amount,rname,rarea,hospital;
		
		exit when donorbyid%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| bloodGrp||' -- '||area||' -- '||' -- '||phonenum || ' -- ' || elgib 
		||' -- ' || amount ||' -- ' || rname ||' -- ' || rarea ||' -- ' || hospital);
		
	end loop;
	close donorbyid;
	

end;
/