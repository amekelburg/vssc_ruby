require_relative '../spec_helper.rb'

describe Vedaspace::Parser do

  describe 'XML import/export' do
    it "should import/export equivalent files" do
      xml_file = './spec/fixtures/NY_TEST.xml'
      doc = nil
      e = nil
      File.open(xml_file) do |f|
        doc = Nokogiri::XML(f)
      end
      File.open(xml_file) do |f|
        e = Vedaspace::Parser.parse_ved_file(f)
      end
            
      #puts e.gp_units
            
      expect(e.to_xml_node.to_s).to be_equivalent_to(doc.root.to_s)
    end
  end
  
  
end
