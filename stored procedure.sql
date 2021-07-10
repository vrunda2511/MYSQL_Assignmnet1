-- Procedure for get course and student details according to the category which will be given by user
DELIMITER $$
CREATE PROCEDURE GetDetails(
    IN  categoryName  VARCHAR(50)
)
BEGIN
	DECLARE exit handler for SQLEXCEPTION
	 BEGIN
		  GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		   @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
		  SELECT @full_error;
	 END;
	IF categoryName= '' then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Category not be Empty,Please enter category.';
	else if cast(categoryName AS nchar) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Please enter correct input';
	else 
		 IF NOT EXISTS (select firstname,lastname,email,contact_no,course_title,sub_category_name,Duration,enrollment_date from category ct,sub_category sc,course c,student s,enrollment en where ct.category_id=sc.category_id and 
			sc.sub_category_id=c.sub_category_id and s.stud_id=en.stud_id and c.course_id=en.course_id and category_name=categoryName) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Record Found on that Category';
		 ELSE
			select firstname,lastname,email,contact_no,course_title,sub_category_name,Duration,enrollment_date from category ct,sub_category sc,course c,student s,enrollment en where ct.category_id=sc.category_id and 
			sc.sub_category_id=c.sub_category_id and s.stud_id=en.stud_id and c.course_id=en.course_id and category_name=categoryName;
		 END IF;
	end if;
End if;
END$$
DELIMITER ;

CALL GetDetails(12);



