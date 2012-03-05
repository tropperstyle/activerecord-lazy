require 'active_record'

module ActiveRecord::Associations::Builder
  class SingularAssociation
    self.valid_options += [:lazy]

    private

    def define_readers
      lazy_constructor = options[:lazy]
      if lazy_constructor
        name = self.name
        mixin.redefine_method(name) do |*params|
          raise ActiveRecordError, 'has_one :lazy option must be one of :build :create :create!' unless [:build, :create, :create!].include?(lazy_constructor)
          association(name).reader(*params) || association(name).send(lazy_constructor, *params)
        end
      else
        super
      end
    end
  end
end
