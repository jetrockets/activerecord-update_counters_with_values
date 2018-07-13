require 'active_record/update_counters_with_values/query_builder'

module ActiveRecord
  module UpdateCountersWithValues
    module ClassMethods
      def update_counters_and_return_values(id, counters)
        query = ActiveRecord::UpdateCountersWithValues::QueryBuilder.new(self).call(id, counters)
        connection.execute(query, "#{class_name.to_s} Update Counters").to_a
      end

      def increment_counter_and_return_value(id, counter)
        update_counters_and_return_values(id, counter => 1)
      end

      def decrement_counter_and_return_value(id, counter)
        update_counters_and_return_values(id, counter => -1)
      end
    end
  end
end
