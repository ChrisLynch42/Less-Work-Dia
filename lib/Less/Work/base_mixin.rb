
module Less
  module Work
    module BaseMixin
      def parameters_hash_check(parameters)
          parameters.to_h
        rescue
          raise ArgumentError, 'Parameter should be Hash or implement #to_h.', caller
      end

      def parameters_pair_check(parameters,key)
        parameters = parameters_hash_check(parameters)
        parameters.fetch(key) do
          raise ArgumentError, 'Parameter hash should contain key ' + key.to_s, caller
        end
      end

    end
  end
end
