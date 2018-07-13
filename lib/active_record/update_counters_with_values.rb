require 'active_record/update_counters_with_values/version'
require 'active_record/update_counters_with_values/class_methods'

module ActiveRecord
  module UpdateCountersWithValues
    def self.included(base)
      base.extend ActiveRecord::UpdateCountersWithValues::ClassMethods
    end
  end
end
