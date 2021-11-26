module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :buildings, [BuildingType], null: false,
      description: "For the building queries"
    def buildings
      Building.all
    end

    field :building, BuildingType, null: false do
      argument :id, ID, required: true
    end
    def building(id:)
      building = Building.find(id)  
    end
    field :factIntervention, FactInterventionType, null: false do
      argument :id, ID, required: true
    end
    def factIntervention(id:)
      fact_intervention = FactIntervention.find(id)
    end
    field :employee, EmployeeType, null: false do
      argument :id, ID, required: true
    end
    def employee(id:)
      employee = Employee.find(id)
    end
    field :battery, BatteryType, null: false do
      argument :id, ID, required: true
    end
    def battery(id:)
      battery = Battery.find(id)
    end
    field :column, ColumnType, null:false do
      argument :id, ID, required: true
    end
    def column(id:)
      column = Column.find(id)
    end
    field :elevator, ElevatorType, null:false do
      argument :id, ID, required: true
    end
    def elevator(id:)
      elevator = Elevator.find(id)
    end
    field :offlineElevator, [ElevatorType], null: false
    def offlineElevator
      Elevator.where.not(status: "Online")
    end
      
  end
end
