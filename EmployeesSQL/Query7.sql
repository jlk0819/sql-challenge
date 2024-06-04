INSERT INTO "select  e.emp_no, e.last_name, e.first_name, d.dept_name from ""Departments"" d
left join ""Dept_manager"" dm on 
dm.dept_no = d.dept_no 
left join ""Employees"" e on
dm.emp_no  = e.emp_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
" (emp_no,last_name,first_name,dept_name) VALUES
	 (110511,'Hagimont','DeForest','Development'),
	 (110567,'DasSarma','Leon','Development'),
	 (111035,'Kaelbling','Przemyslawa','Sales'),
	 (111133,'Zhang','Hauke','Sales');
