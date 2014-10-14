class DiaDatabaseFile
  attr_accessor :file_path
  def read_file(parameters = {})
    self.file_path = parameters[:file_path]
    if self.file_path.nil?
      raise ArguementError, "Missing dia diagram file path.", caller
    end
  end
end