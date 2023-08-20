"8)) Display the Id and Name of the Product ordered after “2021-10-05”."

SELECT product.pro_id, product.pro_name FROM `order`
INNER JOIN supplier_pricing 
ON supplier_pricing.pricing_id = `order`.pricing_id
INNER JOIN product 
ON product.pro_id = supplier_pricing.pro_id
WHERE `order`.ord_date > '2021-10-05';