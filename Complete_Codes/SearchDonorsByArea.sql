clear screen;

set serveroutput on;
set verify off;

declare
	searchArea DONOR.darea%TYPE := '&Area';	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	area DONOR.Darea%TYPE;
	address DONOR.Daddress%TYPE;
	phonenum DONOR.Dphonenum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	
	cursor donorbyarea(matchArea DONOR.Darea%TYPE) is
	select * from DONOR
	where Darea = matchArea;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'Area' ||' -- '|| 'Address' ||' -- '|| 'Phone Number' ||' -- '|| 'Eligibility');
	
	open donorbyarea(searchArea);
	loop
		fetch donorbyarea into id,name,age,gender,bloodGrp,area,address,phonenum,elgib;
		
		exit when donorbyarea%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| TO_CHAR(age)||' -- '||gender||' -- '|| bloodGrp||' -- '||area||' -- '||address||' -- '||phonenum || ' -- ' || elgib);
		
	end loop;
	close donorbyarea;
	

end;
/