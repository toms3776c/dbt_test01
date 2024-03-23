select
	employee_id
	, full_name
	, 'mart' as table_type
from
	{{ ref('employee_names') }}
