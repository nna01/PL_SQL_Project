clear screen;

set serveroutput on;
set verify off;

declare
	inArea DONOR.darea%TYPE := '&Area';
	eligible donor.deligibility%type := 'Yes';
	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	area DONOR.Darea%TYPE;
	address DONOR.Daddress%TYPE;
	phonenum DONOR.Dphonenum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	
	cursor donorbyeligibility(matchArea DONOR.Darea%TYPE, elg donor.Deligibility%type) is
	select * from DONOR
	where Darea = matchArea and Deligibility = elg;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'Area' ||' -- '|| 'Address' ||' -- '|| 'Phone Number' ||' -- '|| 'Eligibility');
	
	open donorbyeligibility(inArea, eligible);
	loop
		fetch donorbyeligibility into id,name,age,gender,bloodGrp,area,address,phonenum,elgib;
		
		exit when donorbyeligibility%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| TO_CHAR(age)||' -- '||gender||
		' -- '|| bloodGrp||' -- '||area||' -- '||address||' -- '||phonenum || ' -- ' || elgib);
		
	end loop;
	close donorbyeligibility;
	

end;
/