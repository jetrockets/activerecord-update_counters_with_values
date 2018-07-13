module ActiveRecord
  module UpdateCountersWithValues
    class QueryBuilder
      def initialize(klass)
        @klass = klass
      end
      def call(id, counters)
        updates = build_updates(counters)
        conditions = build_conditions(id)
        returns = build_returns(counters)

        (<<~SQL)
          UPDATE #{@klass.connection.quote_table_name(@klass.table_name)}
          SET
            #{updates}
          WHERE
            #{conditions}
          RETURNING
            #{returns}
        SQL
      end

    private

      def build_updates(counters)
        counters.map do |counter_name, value|
          operator = value < 0 ? '-' : '+'
          quoted_column = @klass.connection.quote_column_name(counter_name)
          "#{quoted_column} = COALESCE(#{quoted_column}, 0) #{operator} #{value.abs}"
        end.join(', ')
      end

      def build_conditions(id)
        conditions = ["#{@klass.connection.quote_table_name(@klass.table_name)}.#{@klass.connection.quote_column_name(@klass.primary_key)}"]
        if Array.wrap(id).size > 1
          conditions << "IN (#{Array.wrap(id).map{ |id| @klass.connection.quote(id) }.join(', ')})"
        else
          conditions << "= #{@klass.connection.quote(id)}"
        end
        conditions.join(' ')
      end

      def build_returns(counters)
        returns = [@klass.connection.quote_column_name(@klass.primary_key)]
        returns << counters.map { |counter_name, value| @klass.connection.quote_column_name(counter_name) }
        returns.flatten.join(', ')
      end
    end
  end
end
