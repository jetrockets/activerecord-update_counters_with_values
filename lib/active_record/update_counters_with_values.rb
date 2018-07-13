require 'update_counters_with_values/version'

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
    updates = counters.map do |counter_name, value|
      operator = value < 0 ? '-' : '+'
      quoted_column = connection.quote_column_name(counter_name)
      "#{quoted_column} = COALESCE(#{quoted_column}, 0) #{operator} #{value.abs}"
    end

    query = "
    UPDATE \"#{table_name}\"
    SET
      #{updates}
    WHERE
      \"#{table_name}\".\"#{primary_key}\" = #{connection.quote(id)}
    RETURNING
      \"#{counter}\";
    "

    # unscoped.where(primary_key => id).update_all updates.join(', ')
  end
end
