# <xsd:complexType name="PartyRegistration">
#   <xsd:sequence>
#     <xsd:element name="Count" type="xsd:integer"/>
#     <xsd:element name="PartyId" type="xsd:IDREF"/>
#   </xsd:sequence>
# </xsd:complexType>
module Vedaspace::PartyRegistration
  extend InclusionTracking
  extend ActiveSupport::Concern
  include XsdFunctions  
    
  included do
    self.node_name = 'PartyRegistration'
    
    define_element("Count", required: true, type: Fixnum)
    define_element("PartyId", method: :party_identifier)
  end
  
end
