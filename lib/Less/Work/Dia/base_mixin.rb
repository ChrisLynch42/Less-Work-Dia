module BaseMixin
  def parameters_nil?(parameters)
    if parameters.nil? || !parameters.is_a?(::Hash)
      raise ArgumentError, 'Missing parameters hash.', caller
    end
  end

  def parameters_pair_nil?(parameters,key)
    parameters_nil?(parameters)
    pair_nil?(parameters,key)
  end

  def pair_nil?(parameters,key)
    if parameters[key].nil?
      raise ArgumentError, 'Missing value for key ' + key.to_s, caller
    end
  end



end