{% macro get_coordinates(json_field) %}
    SAFE_CAST(JSON_EXTRACT_SCALAR({{ json_field }}, '$.features[0].geometry.coordinates[1]') AS FLOAT64) AS latitude,
    SAFE_CAST(JSON_EXTRACT_SCALAR({{ json_field }}, '$.features[0].geometry.coordinates[0]') AS FLOAT64) AS longitude
{% endmacro %}
