class DiaDatabaseDiagramParser
  attr_accessor :diagram_xml

  def parse(parameters = {})
    if parameters.nil? || !parameters.is_a?(::Hash)
      raise ArgumentError, 'Missing parameters hash.', caller
    end
    self.diagram_xml = parameters[:diagram_xml]

  end
end