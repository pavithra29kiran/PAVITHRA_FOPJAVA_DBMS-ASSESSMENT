
SELECT COUNT(TEST.CUS_GENDER) AS NoOfCustomer, TEST.CUS_GENDER FROM
(
SELECT C.CUS_ID,CUS_NAME,CUS_GENDER,O.ORD_AMOUNT FROM `ORDER` AS O
INNER JOIN CUSTOMER AS C
ON O.CUS_ID=C.CUS_ID
HAVING O.ORD_AMOUNT>=3000
) AS TEST
GROUP BY TEST.CUS_GENDER;



