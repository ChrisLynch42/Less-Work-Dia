class DiaDatabaseDiagramParser
  attr_accessor :diagram_xml

  def parse(parameters = {})
    self.diagram_xml = parameters[:diagram_xml]

  end
end