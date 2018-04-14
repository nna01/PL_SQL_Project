id1 := '10';
id2 := '21';


update DONOR set DID=id2 where DID=id1;
dbms_output.put_line('Donor ID updated in All Tables');

--select * from DONOR where DID=21;
--select * from RECIPIENT where DID=21;
--select * from BLOOD_INVENTORY where DID=21;
--select * from DONATION_DETAILS where DID=21;