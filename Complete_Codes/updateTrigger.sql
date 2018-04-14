create or replace trigger trigDonorUpdate
after update on DONOR
for each row

declare

	id1 DONOR.DID%TYPE := :old.DID;
	id2 DONOR.DID%TYPE := :new.DID;
	
begin

	update RECIPIENT set DID=id2 where DID=id1;
	update BLOOD_INVENTORY set DID=id2 where DID=id1;
	update DONATION_DETAILS set DID=id2 where DID=id1;
end;
/