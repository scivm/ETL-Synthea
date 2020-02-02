INSERT INTO @cdm_schema.location
(
	    location_id,
	    address_1,
	    address_2,
	    city,
	    state,
	    zip,
	    county,
	    location_source_value
)
SELECT
    row_number()over(order by p.id),
    p.address,
    NULL,
    p.city,
    p.state,
    p.zip,
    p.county,
    NULL
FROM @synthea_schema.patients p
