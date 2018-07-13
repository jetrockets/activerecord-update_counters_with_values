require 'active_record/update_counters_with_values/version'

module ActiveRecord
  module UpdateCountersWithValues
    puts "!!!!!!!!"
    # def increment_counter_returning_value(counter, id)
    #   query = "
    #   UPDATE \"#{table_name}\"
    #   SET
    #     \"#{counter}\" = COALESCE(\"#{counter}\", 0) + 1
    #   WHERE
    #     \"#{table_name}\".\"#{primary_key}\" = #{connection.quote(id)}
    #   RETURNING
    #     \"#{counter}\";
    #   "
    #   result = connection.execute(query, "#{class_name.to_s} increment #{counter}")

    #   result[0][counter.to_s]
    # end

    def update_counters_and_return_values(id, counters)
      # updates = counters.map do |counter_name, value|
      #   operator = value < 0 ? '-' : '+'
      #   quoted_column = connection.quote_column_name(counter_name)
      #   "#{quoted_column} = COALESCE(#{quoted_column}, 0) #{operator} #{value.abs}"
      # end.join(', ')

      # conditions = ["#{connection.quote_table_name(table_name)}.#{connection.quote_column_name(primary_key)}"]
      # if Array.wrap(id).size > 1
      #   conditions << "IN (#{Array.wrap(id).map{ |id| connection.quote(id) }.join(', ')})"
      # else
      #   conditions << "= #{connection.quote(id)}"
      # end
      # conditions = conditions.join(' ')

      # returns = [connection.quote_column_name(primary_key)]
      # returns << counters.map { |counter_name, value| connection.quote_column_name(counter_name) }
      # returns = returns.flatten.join(', ')

      query = ActiveRecord::UpdateCountersWithValues::QueryBuilder.new(self).call(id, counters)
      connection.execute(query, "#{class_name.to_s} Update Counters").to_a

      # unscoped.where(primary_key => id).update_all updates.join(', ')
    end

  private

    def build_update_query
    end
  end
end
