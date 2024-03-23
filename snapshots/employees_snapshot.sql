{% snapshot employees_snapshot %}

{{
  config(
    target_database='dbt_training',
    target_schema='snapshots',
    unique_key='employee_id',
    strategy='timestamp',
    updated_at='loaded_at',
  )
}}

select * from {{ source('raw', 'employees') }}

{% endsnapshot %}
