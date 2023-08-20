--10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier
-----------------------------------------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `SUP_RATTINGS`()
BEGIN
SELECT report.supp_id, report.supp_name, report.Average,
    CASE
        WHEN report.Average = 5 THEN 'Excellent Service'
        WHEN report.Average > 4 THEN 'Good Service'
        WHEN report.Average > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service FROM 
    (
		SELECT final.supp_id, supplier.supp_name, final.Average  FROM 
        (
			SELECT test2.supp_id,SUM(test2.rat_ratstars) / COUNT(test2.rat_ratstars) AS Average FROM 
            (
				SELECT supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS FROM supplier_pricing
				INNER JOIN 
                (
					SELECT `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS FROM `order`
					INNER JOIN rating 
                    ON rating.`ord_id` = `order`.ord_id
				) AS test 
                ON test.pricing_id = supplier_pricing.pricing_id
			) AS test2 GROUP BY supplier_pricing.supp_id
        ) AS final 
        INNER JOIN supplier 
        ON final.supp_id = supplier.supp_id 
	) AS report;
