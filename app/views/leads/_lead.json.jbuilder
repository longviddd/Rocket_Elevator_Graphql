json.extract! lead, :id, :full_name, :company_name, :email, :phone, :project_name, :project_description, :department_in_charge_of_the_elevators, :message, :date_of_creation, :created_at, :updated_at
json.url lead_url(lead, format: :json)
