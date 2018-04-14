
set serveroutput on;

declare

    bg DONOR.Dbloodgroup%TYPE := '&BloodGroup';
	res number;
	
begin

	res := countBagNums(bg);
	dbms_output.put_line('Total bags of blood group ' ||bg|| ' = '||res);
	
end;
/