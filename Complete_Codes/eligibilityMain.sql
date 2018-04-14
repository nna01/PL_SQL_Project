
set serveroutput on;

declare
    givenDate DONATION_DETAILS.givenat%TYPE := SYSDATE;
begin
	
	isEligible(7,givenDate);
	--DBMS_OUTPUT.PUT_LINE('calculated date = ' || to_char(givenDate));

end;
/