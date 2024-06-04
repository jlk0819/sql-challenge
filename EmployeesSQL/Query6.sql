INSERT INTO "select  e.emp_no, e.last_name, e.first_name from ""Departments"" d
left join ""Dept_manager"" dm on 
dm.dept_no = d.dept_no 
left join ""Employees"" e on
dm.emp_no  = e.emp_no
where d.dept_name = 'Sales'
" (emp_no,last_name,first_name) VALUES
	 (111035,'Kaelbling','Przemyslawa'),
	 (111133,'Zhang','Hauke');
