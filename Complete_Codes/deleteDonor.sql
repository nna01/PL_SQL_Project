clear screen;

set serveroutput on;
set verify off;

declare

	id DONOR.DID%TYPE := '&DonorID';
	
begin
	
	delete from DONOR where DID=id;
	dbms_output.put_line('data deleted from blood_inventory');
end;
/