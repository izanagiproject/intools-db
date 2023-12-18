-- Example Select Query

SELECT E.NAME AS EMPLOYEE_NAME,
	T.NAME AS TEAM_NAME,
	A.NAME AS AREA_NAME,
	P.NAME AS PLANT_NAME,
	M.NAME AS MATERIAL_NAME,
	M.MAKER,
	M.FRAME AS QCODE,
	MSP.CURRENT,
	MSP.VOLTAGE,
	MS.BASE_LENGTH,
	MS.BASE_WIDTH
FROM MATERIALS M
JOIN EMPLOYEES E ON M.EMPLOYEE_ID = E.ID
JOIN TEAMS T ON E.TEAM_ID = T.ID
JOIN AREAS A ON M.AREA_ID = A.ID
JOIN PLANTS P ON A.PLANT_ID = P.ID
JOIN MOTORS_SPECIFICATION MSP ON M.ID = MSP.MATERIAL_ID
JOIN MOTORS_SIZE MS ON M.ID = MS.MATERIAL_ID;