
name := 'Ridhi';
age := 25;
gender := 'Female';
bloodGrp := 'AB-';
area := 'Gulshan';
address := 'Road no. 5 House no. 10 Gulshan-2';
phonenum := '235252525';
elgib := 'No';

DBMS_OUTPUT.PUT_LINE('Name'||' -- ' || 'Age'||' -- ' || 'Gender' ||' -- '|| 'Blood Group'||' -- '|| 'Area' ||' -- '|| 'Address' ||' -- '|| 'Phone Number');
DBMS_OUTPUT.PUT_LINE( name ||' -- '|| TO_CHAR(age)||' -- '||gender||' -- '|| bloodGrp||' -- '||area||' -- '||address||' -- '||phonenum);
insert into DONOR values(donor_sequence.nextval,name,age,gender,bloodGrp,area,address,phonenum,elgib);

