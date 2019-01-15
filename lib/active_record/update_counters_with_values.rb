require 'active_record/update_counters_with_values/version'
require 'active_record/update_counters_with_values/class_methods'

module ActiveRecord
  module UpdateCountersWithValues
    def self.included(base)
      base.extend ActiveRecord::UpdateCountersWithValues::ClassMethods
    end

    def update_counters_with_values(counters)
      results = self.class.update_counters_and_return_values(id, counters)[0]

      counters.each do |key, value|
        write_attribute(key, results[key.to_s])
      end

      clear_attribute_changes(counters.keys)

      self
    end

    def increment_counter_with_value(counter)
      update_counters_with_values(counter => 1)
    end

    def decrement_counter_with_value(counter)
      update_counters_with_values(counter => -1)
    end
  end
end
