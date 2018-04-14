
	searchID:= 10;	
	
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Donor Name'||' -- ' || ' -- '|| 'Blood Group'||' -- '|| 'Donor Area' ||' -- '|| 
	' -- '|| 'Donor Phone Number' ||' -- '|| 'Donor Eligibility' ||' -- ' || 'Amount' ||' -- ' || 'Recipient Name' ||' -- ' || 'Recipient address' ||' -- ' || 'Hospital');
	
	open donorbyid(searchID);
	loop
		fetch donorbyid into id,name,bloodGrp,area,phonenum,elgib,amount,rname,rarea,hospital;
		
		exit when donorbyid%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| bloodGrp||' -- '||area||' -- '||' -- '||phonenum || ' -- ' || elgib 
		||' -- ' || amount ||' -- ' || rname ||' -- ' || rarea ||' -- ' || hospital);
		
	end loop;
	close donorbyid;
	
