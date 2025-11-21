% Facts: student(StudentName, TeacherName, SubjectCode)

student('Raju', 'Mr.Reddy', 'CS101').
student('Anita', 'Ms.Swati', 'CS102').
student('Kiran', 'Mr.Reddy', 'CS101').
student('Rohit', 'Mrs.Sharma', 'CS103').
student('Deepa', 'Ms.Swati', 'CS102').

% Rule to find all students under a teacher
students_of_teacher(Teacher, Student) :-
    student(Student, Teacher, _).

% Rule to find teacher handling subject
teacher_of_subject(SubjectCode, Teacher) :-
    student(_, Teacher, SubjectCode).
