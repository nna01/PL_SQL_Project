
	inArea := 'Winterfell';
	eligible := 'Yes';
	
	
	DBMS_OUTPUT.PUT_LINE('DID'||' -- '||'Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'Area' ||' -- '|| 'Address' ||' -- '|| 'Phone Number' ||' -- '|| 'Eligibility');
	
	open donorbyeligibility(inArea, eligible);
	loop
		fetch donorbyeligibility into id,name,age,gender,bloodGrp,area,address,phonenum,elgib;
		
		exit when donorbyeligibility%notfound;
		
		DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -- '|| name ||' -- '|| TO_CHAR(age)||' -- '||gender||
		' -- '|| bloodGrp||' -- '||area||' -- '||address||' -- '||phonenum || ' -- ' || elgib);
		
	end loop;
	close donorbyeligibility;
	
