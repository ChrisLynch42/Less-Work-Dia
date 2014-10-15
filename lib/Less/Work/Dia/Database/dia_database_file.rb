require 'nokogiri'

class DiaDatabaseFile

  def read_file(parameters = {})
    if parameters.nil? || !parameters.is_a?(::Hash)
      raise ArgumentError, 'Missing parameters hash.'
    end
    file_path = parameters[:file_path]
    if file_path.nil?
      raise ArgumentError, 'Missing dia diagram file path.'
    end
    parse_file_content(open_file(file_path))
  end


  private
  def open_file(file_path)
    if File.exist?(file_path)
      f = File.open(file_path)
    end
  end

  def parse_file_content(file)
    if !file.nil?
      dia_xml = Nokogiri::XML(file)
    end
  end
end