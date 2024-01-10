# frozen_string_literal: true

# The `ApplicationRecord` class is the base class for all models in the application.
# It inherits from `ActiveRecord::Base` and serves as an abstract class.
# By convention, all models in the application should inherit from `ApplicationRecord`.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
