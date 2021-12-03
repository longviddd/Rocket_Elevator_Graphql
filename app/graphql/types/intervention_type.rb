module Types
  class InterventionType < Types::BaseObject
    field :id, ID, null: false
    field :building_id, Integer, null: false
    field :author, Integer, null: false
    field :battery_id, Integer, null: false
    field :column_id, Integer, null: true
    field :elevator_id, Integer, null: true
    field :start_intervention, GraphQL::Types::ISO8601DateTime, null: true
    field :end_intervention, GraphQL::Types::ISO8601DateTime, null: true
    field :result, String, null: true
    field :report, String, null: true
    field :status, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :customer_id, Integer, null: false
    field :employee_id, Integer, null: true
  end
end
