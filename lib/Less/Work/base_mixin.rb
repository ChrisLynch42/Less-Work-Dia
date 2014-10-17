
module Less
  module Work
    module BaseMixin
      def parameters_hash?(parameters)
        begin
          parameters = parameters.to_h
        rescue
          raise ArgumentError, 'Parameter should be Hash or implement #to_h.', caller
        end
      end

      def parameters_pair_nil?(parameters,key)
        parameters_hash?(parameters)
        parameters.fetch(key) do
          raise ArgumentError, 'Parameter should be hash containing key ' + key.to_s, caller
        end
      end

    end
  end
end
