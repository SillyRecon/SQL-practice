/**
Creating a clustered index to materialize the product_master view.
**/
CREATE UNIQUE  CLUSTERED INDEX
	ucidx_product_id
ON product_master([Product ID]);
