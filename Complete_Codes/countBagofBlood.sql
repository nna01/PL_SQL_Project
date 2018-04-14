
create or replace function countBagNums(matchBloodGroup DONOR.Dbloodgroup%TYPE)
  return number
  is
  
  totalBags number;

begin
	
	 select count(bagnumber) into totalBags from BLOOD_INVENTORY
	 where DID in ( select DID from DONOR where Dbloodgroup = matchBloodGroup);
	 
	return totalBags;

end countBagNums;
/






