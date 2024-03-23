with employee as (
	select
		employee_id
		, full_name
		, 'mart' as table_type
		, job_id
	from
		{{ ref('employee_names') }}
),
job as (
	select
		job_id
		, job_title
		, max_salary
	from
		{{ source('raw','jobs') }}
),
final as (
	select
		emp.employee_id
		, emp.full_name
		, emp.table_type
		, job.max_salary
		, {{ double_column('job.max_salary') }} as double_salary
	from
		employee as emp
	left join job
		on emp.job_id = job.job_id
)

select * from final
