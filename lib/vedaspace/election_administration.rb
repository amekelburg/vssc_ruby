# <xsd:complexType name="ElectionAdministration">
#   <xsd:sequence>
#     <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0"/>
#     <xsd:element name="ElectionOfficialPersonId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Name" type="xsd:string" minOccurs="0"/>
#   </xsd:sequence>
# </xsd:complexType>
module Vedaspace::ElectionAdministration
  extend InclusionTracking
  extend ActiveSupport::Concern
  include XsdFunctions  
    
  included do
    self.node_name = 'ElectionAdministration'
    
    define_element("ContactInformation", type: Vedaspace::ContactInformation)
    define_element("ElectionOfficialPersonId")
  
    define_element("ElectionOfficialPersonId", type: Vedaspace::ElectionAdministrationOfficialIdRef, method: :election_official_person_id_refs, multiple: true)
  
    define_element("Name")
  end
  
end