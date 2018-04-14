clear screen;

set serveroutput on;
set verify off;

declare
	bg DONOR.Dbloodgroup%TYPE := '&BloodGroup';	
	id DONOR.DID%TYPE;
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	area DONOR.Darea%TYPE;
	address DONOR.Daddress%TYPE;
	phonenum DONOR.Dphonenum%TYPE;
	elgib DONOR.Deligibility%TYPE;
	
	cursor donorbygroup(matchGrp DONOR.Dbloodgroup%TYPE) is
	select * from DONOR
	where Dbloodgroup = matchGrp;
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'Area' ||' -- '|| 'Address' ||' -- '|| 'Phone Number' ||' -- '|| 'Eligibility');
	
	open donorbygroup(bg);
	
	loop
		fetch donorbygroup into id,name,age,gender,bloodGrp,area,address,phonenum,elgib;
		
		exit when donorbygroup%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| TO_CHAR(age)||' -- '||gender||' -- '|| bloodGrp||' -- '||area||' -- '||address||' -- '||phonenum || ' -- ' || elgib);
		
	end loop;
	close donorbygroup;
	

end;
/