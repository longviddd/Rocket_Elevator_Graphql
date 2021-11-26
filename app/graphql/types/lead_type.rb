module Types
  class LeadType < Types::BaseObject
    field :id, ID, null: false
    field :full_name, String, null: true
    field :company_name, String, null: true
    field :email, String, null: true
    field :phone, String, null: true
    field :project_name, String, null: true
    field :project_description, String, null: true
    field :department_in_charge_of_the_elevators, String, null: true
    field :message, String, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :date_of_creation, GraphQL::Types::ISO8601Date, null: true
  end
end
