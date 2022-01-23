SELECT CONCAT(Name,'(', LEFT(Occupation,1),')') 
FROM OCCUPATIONS
ORDER BY name;

SELECT CONCAT('There are a total of ', COUNT(Name),' ', LOWER(Occupation),'s.') 
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Name) ASC;