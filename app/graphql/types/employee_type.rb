module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :function, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :email, String, null: true
    field :user_id, Integer, null: true
    field :factIntervention , [Types::FactInterventionType], null: true
    def factIntervention
      FactIntervention.where(employee_id: object.id)
    end
  end
  
end
