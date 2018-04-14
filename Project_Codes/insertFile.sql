opt := 2;

IF opt = 1 then
		dbms_output.put_line('Insert New Data');
		@@insertDonor.sql;
	elsif opt = 2 then
		dbms_output.put_line('Calculate and Insert New Eligibility for ID 7');
		@@eligibilityMain.sql;
END IF;	