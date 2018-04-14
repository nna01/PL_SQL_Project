create or replace trigger trigDonorDelete
after delete on DONOR
for each row

declare

	id1 DONOR.DID%TYPE := :old.DID;
	
begin

	delete from RECIPIENT where DID=id1;
	delete from BLOOD_INVENTORY where DID=id1;
	delete from DONATION_DETAILS where DID=id1;

end;
/