clear screen;

set serveroutput on;
set verify off;

declare

	id1 DONOR.DID%TYPE := '&DonorID';
	id2 DONOR.DID%TYPE := '&NewDonorID';
	
begin
	
	update DONOR set DID=id2 where DID=id1;
	dbms_output.put_line('data update also in blood_inventory');
end;
/