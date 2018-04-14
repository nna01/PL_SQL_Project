opt := 1;
dbms_output.put_line(' ');
IF opt = 1 then
		dbms_output.put_line('Search By Blood Group');
		@@searchDonorsByBlood.sql;
	elsif opt = 2 then
		dbms_output.put_line('Count Bags under a Blood Group');
		@@countBagMain.sql;
	elsif opt = 3 then
		dbms_output.put_line('Search All Info of Donor by ID');
		@@SearchDonorByID.sql;
    elsif opt = 4 then
		dbms_output.put_line('Search Donor by Area');
		@@SearchDonorsByArea.sql;
	elsif opt = 5 then
		dbms_output.put_line('Search By Eligibility of an Area');
		@@searchEligible.sql;
	elsif opt = 6 then
		dbms_output.put_line('Search All Inforamtion of Recipient');
		@@SearchRecipient.sql;
END IF;	