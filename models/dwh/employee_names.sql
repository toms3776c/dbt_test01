select
	"employee_id" as employee_id
	, concat("first_name", ' ', "last_name") as full_name
	, job_id
from
	{{ source('raw', 'employees') }}

{% if is_incremental() %}
	where "employee_id" not in (select "employee_id" from {{ this}} )
{% endif %}
