require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/xml_fragment'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_fragments'
require_relative 'test_parameter_mixin_mixin'
require_relative 'test_constructor_requires_hash_mixin'

module Less
  module Work
    module Dia
      module Database
        class TestXMLFragment < Minitest::Test
          include TestParameterMixinMixin
          include TestConstructorRequiresHashMixin

          # Called before every test method runs. Can be used
          # to set up fixture information.
          def setup
            @test_object = return_valid_xml_fragment_object
            @test_class_constant = XMLFragment

          end

          # Called after every test method runs. Can be used to tear
          # down fixture information.

          def teardown
            # Do nothing
          end



          private
          def return_valid_hash_parameter
            diagram_fragments = DiagramFragments.new()
            {:diagram_fragment => diagram_fragments.column}
          end

          def return_valid_xml_fragment_object
            XMLFragment.new(return_valid_hash_parameter)
          end
        end
      end
    end
  end
end