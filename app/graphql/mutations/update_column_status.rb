module Mutations
  class UpdateColumnStatus < BaseMutation
    argument :id, ID, required: true
    argument :status, String, required:false
    field :column, Types::ColumnType, null:true
    field :success, Boolean, null: false
    field :errors, [String], null: false
    def authorized?(**args)
      super

      # E.g. with Pundit
      # super &&
      #   BookPolicy.new(context[:current_user], Record.find_by(id: args[:id])).update?
    end
    def resolve(id:, **args)
      record = Column.find(id)
      if record.update(args)
        { success: true, column: record, errors: [] }
      else
        { success: false, column: nil, errors: record.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      return { success: false, column: nil, errors: ['record-not-found'] }
    end
  end
end
