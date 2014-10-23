module Less
  module Work
    module Dia
      module Database
        module DiagramXMLMixin

          def empty_diagram_xml
            <<-emptydiagram
              <?xml version="1.0" encoding="UTF-8"?>
              <dia:diagram xmlns:dia="http://www.lysator.liu.se/~alla/dia/">
                <dia:diagramdata>
                  <dia:attribute name="background">
                    <dia:color val="#ffffff"/>
                  </dia:attribute>
                  <dia:attribute name="pagebreak">
                    <dia:color val="#000099"/>
                  </dia:attribute>
                  <dia:attribute name="paper">
                    <dia:composite type="paper">
                      <dia:attribute name="name">
                        <dia:string>#Letter#</dia:string>
                      </dia:attribute>
                      <dia:attribute name="tmargin">
                        <dia:real val="2.5399999618530273"/>
                      </dia:attribute>
                      <dia:attribute name="bmargin">
                        <dia:real val="2.5399999618530273"/>
                      </dia:attribute>
                      <dia:attribute name="lmargin">
                        <dia:real val="2.5399999618530273"/>
                      </dia:attribute>
                      <dia:attribute name="rmargin">
                        <dia:real val="2.5399999618530273"/>
                      </dia:attribute>
                      <dia:attribute name="is_portrait">
                        <dia:boolean val="true"/>
                      </dia:attribute>
                      <dia:attribute name="scaling">
                        <dia:real val="1"/>
                      </dia:attribute>
                      <dia:attribute name="fitto">
                        <dia:boolean val="false"/>
                      </dia:attribute>
                    </dia:composite>
                  </dia:attribute>
                  <dia:attribute name="grid">
                    <dia:composite type="grid">
                      <dia:attribute name="width_x">
                        <dia:real val="1"/>
                      </dia:attribute>
                      <dia:attribute name="width_y">
                        <dia:real val="1"/>
                      </dia:attribute>
                      <dia:attribute name="visible_x">
                        <dia:int val="1"/>
                      </dia:attribute>
                      <dia:attribute name="visible_y">
                        <dia:int val="1"/>
                      </dia:attribute>
                      <dia:composite type="color"/>
                    </dia:composite>
                  </dia:attribute>
                  <dia:attribute name="color">
                    <dia:color val="#d8e5e5"/>
                  </dia:attribute>
                  <dia:attribute name="guides">
                    <dia:composite type="guides">
                      <dia:attribute name="hguides"/>
                      <dia:attribute name="vguides"/>
                    </dia:composite>
                  </dia:attribute>
                </dia:diagramdata>
                <dia:layer name="Background" visible="true" active="true">
                </dia:layer>
              </dia:diagram>
            emptydiagram
          end

          def reference_xml
            <<-referencexml
              <dia:object type="Database - Reference" version="0" id="O0">
                <dia:attribute name="obj_pos">
                  <dia:point val="73.8,44.02"/>
                </dia:attribute>
                <dia:attribute name="obj_bb">
                  <dia:rectangle val="73.8,43.37;80.27,46.07"/>
                </dia:attribute>
                <dia:attribute name="meta">
                  <dia:composite type="dict"/>
                </dia:attribute>
                <dia:attribute name="orth_points">
                  <dia:point val="73.8,44.02"/>
                  <dia:point val="77.035,44.02"/>
                  <dia:point val="77.035,46.07"/>
                  <dia:point val="80.27,46.07"/>
                </dia:attribute>
                <dia:attribute name="orth_orient">
                  <dia:enum val="0"/>
                  <dia:enum val="1"/>
                  <dia:enum val="0"/>
                </dia:attribute>
                <dia:attribute name="orth_autoroute">
                  <dia:boolean val="true"/>
                </dia:attribute>
                <dia:attribute name="text_colour">
                  <dia:color val="#000000"/>
                </dia:attribute>
                <dia:attribute name="line_colour">
                  <dia:color val="#000000"/>
                </dia:attribute>
                <dia:attribute name="line_width">
                  <dia:real val="0.10000000000000001"/>
                </dia:attribute>
                <dia:attribute name="line_style">
                  <dia:enum val="0"/>
                  <dia:real val="1"/>
                </dia:attribute>
                <dia:attribute name="corner_radius">
                  <dia:real val="0"/>
                </dia:attribute>
                <dia:attribute name="end_arrow">
                  <dia:enum val="22"/>
                </dia:attribute>
                <dia:attribute name="end_arrow_length">
                  <dia:real val="0.5"/>
                </dia:attribute>
                <dia:attribute name="end_arrow_width">
                  <dia:real val="0.5"/>
                </dia:attribute>
                <dia:attribute name="start_point_desc">
                  <dia:string>#1#</dia:string>
                </dia:attribute>
                <dia:attribute name="end_point_desc">
                  <dia:string>#n#</dia:string>
                </dia:attribute>
                <dia:attribute name="normal_font">
                  <dia:font family="monospace" style="0" name="Courier"/>
                </dia:attribute>
                <dia:attribute name="normal_font_height">
                  <dia:real val="0.59999999999999998"/>
                </dia:attribute>
                <dia:connections>
                  <dia:connection handle="0" to="O47" connection="13"/>
                  <dia:connection handle="1" to="O52" connection="16"/>
                </dia:connections>
              </dia:object>
            referencexml
          end

          def empty_table_xml
            <<-emptytablexml
              <dia:object type="Database - Table" version="0" id="O0">
                <dia:attribute name="obj_pos">
                  <dia:point val="80.27,43.07"/>
                </dia:attribute>
                <dia:attribute name="obj_bb">
                  <dia:rectangle val="80.27,43.07;88.5,46.57"/>
                </dia:attribute>
                <dia:attribute name="meta">
                  <dia:composite type="dict"/>
                </dia:attribute>
                <dia:attribute name="elem_corner">
                  <dia:point val="80.27,43.07"/>
                </dia:attribute>
                <dia:attribute name="elem_width">
                  <dia:real val="8.2300000000000004"/>
                </dia:attribute>
                <dia:attribute name="elem_height">
                  <dia:real val="3.5"/>
                </dia:attribute>
                <dia:attribute name="text_colour">
                  <dia:color val="#000000"/>
                </dia:attribute>
                <dia:attribute name="line_colour">
                  <dia:color val="#000000"/>
                </dia:attribute>
                <dia:attribute name="fill_colour">
                  <dia:color val="#ffffff"/>
                </dia:attribute>
                <dia:attribute name="line_width">
                  <dia:real val="0.10000000000000001"/>
                </dia:attribute>
                <dia:attribute name="name">
                  <dia:string>#campaigns_scenarios#</dia:string>
                </dia:attribute>
                <dia:attribute name="comment">
                  <dia:string>##</dia:string>
                </dia:attribute>
                <dia:attribute name="visible_comment">
                  <dia:boolean val="false"/>
                </dia:attribute>
                <dia:attribute name="tagging_comment">
                  <dia:boolean val="false"/>
                </dia:attribute>
                <dia:attribute name="underline_primary_key">
                  <dia:boolean val="true"/>
                </dia:attribute>
                <dia:attribute name="bold_primary_keys">
                  <dia:boolean val="false"/>
                </dia:attribute>
                <dia:attribute name="normal_font">
                  <dia:font family="monospace" style="0" name="Courier"/>
                </dia:attribute>
                <dia:attribute name="name_font">
                  <dia:font family="sans" style="80" name="Helvetica-Bold"/>
                </dia:attribute>
                <dia:attribute name="comment_font">
                  <dia:font family="sans" style="8" name="Helvetica-Oblique"/>
                </dia:attribute>
                <dia:attribute name="normal_font_height">
                  <dia:real val="0.80000000000000004"/>
                </dia:attribute>
                <dia:attribute name="name_font_height">
                  <dia:real val="0.69999999999999996"/>
                </dia:attribute>
                <dia:attribute name="comment_font_height">
                  <dia:real val="0.69999999999999996"/>
                </dia:attribute>
                <dia:attribute name="attributes">
                </dia:attribute>
              </dia:object>
            emptytablexml
          end

          def column_xml
            <<-columnxml
              <dia:composite type="table_attribute">
                <dia:attribute name="name">
                  <dia:string>#id#</dia:string>
                </dia:attribute>
                <dia:attribute name="type">
                  <dia:string>#Integer#</dia:string>
                </dia:attribute>
                <dia:attribute name="comment">
                  <dia:string>##</dia:string>
                </dia:attribute>
                <dia:attribute name="primary_key">
                  <dia:boolean val="true"/>
                </dia:attribute>
                <dia:attribute name="nullable">
                  <dia:boolean val="false"/>
                </dia:attribute>
                <dia:attribute name="unique">
                  <dia:boolean val="true"/>
                </dia:attribute>
              </dia:composite>
            columnxml
          end

        end
      end
    end
  end
end

