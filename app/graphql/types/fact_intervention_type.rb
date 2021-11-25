module Types
  class FactInterventionType < Types::BaseObject
    field :creation_date, GraphQL::Types::ISO8601Date, null: true
    field :intervention_id, Integer, null: false
    field :employee_id, Integer, null: false
    field :building_id, Integer, null: false
    field :battery_id, Integer, null: true
    field :column_id, Integer, null: true
    field :elevator_id, Integer, null: true
    field :start_intervention, GraphQL::Types::ISO8601DateTime, null: false
    field :end_intervention, GraphQL::Types::ISO8601DateTime, null: true
    field :result, String, null: false
    field :report, String, null: true
    field :status, String, null: false
  end
end
