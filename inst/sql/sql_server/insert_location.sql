INSERT INTO @cdm_schema.location
(
	    location_id,
	    address_1,
	    address_2,
	    city,
	    state,
	    zip,
	    county,
	    country,
	    location_source_value,
	    latitude,
	    longitude
)
SELECT
    row_number()over(order by p.id),
    p.address,
    NULL,
    p.city,
    p.state,
    p.zip,
    p.county,
    'FI',
    NULL,
    p.lat,
    p.lon
    
FROM @synthea_schema.patients p
