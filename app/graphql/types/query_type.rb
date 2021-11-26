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
    field :leadBeforeThirtyDaysThatBecomeCustomer, [LeadType], null: false
    def leadBeforeThirtyDaysThatBecomeCustomer
      return_leads = Array.new
      relevant_leads = Lead.where.not("date_of_creation < ?", 31.days.ago)
      relevant_leads.each do |lead|
        if Customer.where(:email_of_the_company_contact => lead.email).blank? == true
          return_leads.append(lead)
        end
      end
      return_leads
    end
    field :buildingsWithIntervention, [BuildingType], null: false
    def buildingsWithIntervention
      return_buildings = Array.new
      Elevator.all.each do |elevator|
        if elevator.status.to_s == "Intervention" && return_buildings.include?(elevator.column.battery.building) == false
          return_buildings.append(elevator.column.battery.building)
        end
      end
      Column.all.each do |column|
        if column.status.to_s == "Intervention" && return_buildings.include?(column.battery.building) == false
          return_buildings.append(column.battery.building)
        end
      end
      Battery.all.each do |battery|
        if battery.status.to_s == "Intervention" && return_buildings.include?(battery.building) == false
          return_buildings.append(battery.building)
        end
      end
      return_buildings
    end
    # field :leads, [LeadType], null:false
    # def leads
    #   Lead.all
    # end
      
  end
end
