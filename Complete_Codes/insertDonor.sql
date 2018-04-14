clear screen;

set serveroutput on;
set verify off;

declare

	name DONOR.Dname%TYPE := '&Name';
	age DONOR.Dage%TYPE := '&Age';
	gender DONOR.Dgender%TYPE := '&Gender';
	bloodGrp DONOR.Dbloodgroup%TYPE := '&BloodGroup';
	area DONOR.Darea%TYPE := '&Area';
	address DONOR.Daddress%TYPE := '&Address';
	phonenum DONOR.Dphonenum%TYPE := '&PhoneNumber';
	
begin
    
	
	DBMS_OUTPUT.PUT_LINE('Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'Area' ||' -- '|| 'Address' ||' -- '|| 'Phone Number');
	DBMS_OUTPUT.PUT_LINE( name ||' -- '|| TO_CHAR(age)||' -- '||gender||' -- '|| bloodGrp||' -- '||area||' -- '||address||' -- '||phonenum);
	insert into DONOR values(donor_sequence.nextval,name,age,gender,bloodGrp,area,address,phonenum);

end;
/