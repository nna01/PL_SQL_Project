clear screen;

set serveroutput on;
set verify off;

@@BloodBankTable.sql
@@insertTrigger.sql;

DECLARE
   
	x number := &x;	
	
	--variables for insertDonor
	name DONOR.Dname%TYPE;
	age DONOR.Dage%TYPE;
	gender DONOR.Dgender%TYPE;
	bloodGrp DONOR.Dbloodgroup%TYPE;
	area DONOR.Darea%TYPE;
	address DONOR.Daddress%TYPE;
	phonenum DONOR.Dphonenum%TYPE;
	
	--variables for updateDonor
	id1 DONOR.DID%TYPE;
	id2 DONOR.DID%TYPE;
	
	wrong_value exception;
	
begin

	IF x = 1 then
		dbms_output.put_line('1 Pressed');
		--@@insertDonor.sql;
	elsif x = 2 then
		dbms_output.put_line('2 Pressed');
		@C:\Users\Arony\Desktop\DDB Project\With Static Values\insertDonor.sql;
	elsif x = 3 then
		dbms_output.put_line('3 Pressed');
		--@@updateDonor.sql;
	elsif x = 4 then
		dbms_output.put_line('4 Pressed ');
		--@@deleteDonor.sql;
	else
		raise wrong_value;
	END IF;	

	
exception

	when wrong_value then
		dbms_output.put_line('You have pressed a wrong digit!');
	
end;
/