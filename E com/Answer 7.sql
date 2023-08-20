"7) Find the least expensive product from each category and print the table with category id,
  name, product name and price of the product"
  
  SELECT category.cat_id, category.cat_name, MIN(t3.min_price) AS Min_Price FROM category 
INNER JOIN 
(
	SELECT product.cat_id, product.pro_name, t2.* FROM product
    INNER JOIN 
    (
		SELECT pro_id, MIN(supp_price) AS Min_Price FROM supplier_pricing  GROUP BY pro_id
	) AS t2 WHERE t2.pro_id = product.pro_id
) AS t3 WHERE t3.cat_id = category.cat_id
GROUP BY t3.cat_id;
