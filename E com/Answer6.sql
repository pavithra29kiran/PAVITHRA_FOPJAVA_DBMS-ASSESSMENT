select * from supplier as S
inner join
(
  select supp_id from supplier_pricing group by supp_id having count(supp_id)>2
  ) as test
  on test.supp_id=s.supp_id;