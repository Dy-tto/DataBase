SELECT ANIMAL_TYPE,COUNT(ANIMAL_ID) 
FROM ANIMAL_INS
WHERE ANIMAL_TYPE='Cat' 
	OR ANIMAL_TYPE='Dog'
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE ASC;