
DROP PROCEDURE isEligible;

create or replace procedure isEligible(
		id in DONOR.DID%TYPE, presentDate in out DONATION_DETAILS.givenat%TYPE)
		IS
		
	calcDate DONATION_DETAILS.givenat%TYPE;
	givenDate DONATION_DETAILS.givenat%TYPE;
	
	cursor getDateFrom( tempid in DONOR.DID%TYPE ) is
	select givenat from DONATION_DETAILS where DID=tempid;
	
begin  

	open getDateFrom(id);
	
	loop
		fetch getDateFrom into givenDate;
		exit when getDateFrom%notfound;		
	end loop;
	
	close getDateFrom;
	
	calcDate:= add_months(givenDate, 4);
	--DBMS_OUTPUT.PUT_LINE('calculated date = ' || to_char(calcDate));
	
	if calcDate > presentDate then
		update Donor set Deligibility = 'No' where DID=id;
	else
		update Donor set Deligibility = 'Yes' where DID=id;
	end if;
	 
end isEligible;
/



--update donation_details set givenat = add_months(givenat, 4) where DID=10;
