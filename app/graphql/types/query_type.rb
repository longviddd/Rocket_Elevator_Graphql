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
  end
end
