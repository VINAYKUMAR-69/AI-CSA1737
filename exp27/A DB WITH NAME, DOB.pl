% Database of persons with Date of Birth

dob(vinay, '12-05-2003').
dob(rahul, '21-10-2002').
dob(kiran, '03-03-2004').
dob(sneha, '15-07-2005').

% Query rule
show_dob(Name, Date) :- dob(Name, Date).
