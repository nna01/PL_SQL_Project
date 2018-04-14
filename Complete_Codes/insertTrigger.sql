create or replace trigger trigDonorInsert
after insert on DONOR
for each row

declare

	id DONOR.DID%TYPE := :new.DID;
	
begin

	dbms_output.put_line('data inserted');
	insert into RECIPIENT(RID,DID) values(recip_sequence.nextval,id);
	insert into BLOOD_INVENTORY(DID,bagnumber) values(id,blinven_sequence.nextval);
	insert into DONATION_DETAILS(DID,donationnumber) values(id,dondet_sequence.nextval);

	
end;
/