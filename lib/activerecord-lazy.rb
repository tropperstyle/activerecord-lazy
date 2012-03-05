require 'active_record'

module ActiveRecord
  module LazyAssociations
    def self.extended(base)
      class << base
        alias_method_chain :association_accessor_methods, :lazy
      end
    end

    def association_accessor_methods_with_lazy(reflection, association_proxy_class)
      original = association_accessor_methods_without_lazy(reflection, association_proxy_class)

      if reflection.options[:lazy]
        constructor = reflection.options[:lazy].to_s
        raise ActiveRecordError, 'has_one :lazy option must be :build or :create' unless %w[build create].include?(constructor)

        define_method "#{reflection.name}_with_lazy" do
          send("#{reflection.name}_without_lazy") || send("#{constructor}_#{reflection.name}")
        end

        alias_method_chain reflection.name, :lazy
      end

      original
    end
  end

  class Base
    valid_keys_for_has_one_association << :lazy
    extend LazyAssociations
  end

end

