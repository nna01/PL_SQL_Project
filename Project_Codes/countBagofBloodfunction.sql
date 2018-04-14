
create or replace function countBagNums(matchGrp DONOR.Dbloodgroup%TYPE)
  return number
  is
  
  coNum number;

begin
	
	 select count(bagnumber) into coNum from BLOOD_INVENTORY
	 where DID in ( select DID from DONOR where Dbloodgroup = matchGrp);
	 
	return coNum;

end countBagNums;
/






