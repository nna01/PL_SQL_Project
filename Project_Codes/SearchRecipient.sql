
	rin:= '5010';
	
	DBMS_OUTPUT.PUT_LINE('Recipient ID'||' -- '||' Recipient Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group' ||' -- '||
	'Address' ||' -- '|| 'Phone Number' ||' -- '|| 'Donor ID' ||' -- '|| 'Donor Name' ||' -- '|| 'Given Date' ||' -- '|| 'Hospital'||' -- '|| 'Amount');
	
	open recipientbyid(rin);
	    --loop
		fetch recipientbyid into R_ID,R_name,R_age,R_gender,R_bloodgroup,R_address,R_phonenum,D_ID,D_name,givendate,hospital,amount;
		--exit when recipientbyid%notfound;
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(R_ID)||' -- '|| R_name ||' -- '|| TO_CHAR(R_age)||' -- '|| R_gender||' -- '|| R_bloodgroup||' -- '|| R_address ||
		' -- '||R_phonenum || ' -- ' || D_ID|| ' -- ' || D_name|| ' -- ' || givendate || ' -- ' || hospital|| ' -- ' || amount);
		--end loop;
	close recipientbyid;
	
