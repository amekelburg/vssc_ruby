# <xsd:complexType name="ContactInformation">
#   <xsd:sequence>
#     <xsd:element name="AddressLine" type="xsd:string" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Directions" type="InternationalizedText" minOccurs="0" maxOccurs="1"/>
#     <xsd:element name="Email" type="AnnotatedString" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Fax" type="AnnotatedString" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="LatLng" minOccurs="0" maxOccurs="1">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Latitude" type="xsd:float" minOccurs="1" maxOccurs="1"/>
#           <xsd:element name="Longitude" type="xsd:float" minOccurs="1" maxOccurs="1"/>
#           <xsd:element name="Source" type="xsd:string" minOccurs="0" maxOccurs="1"/>
#         </xsd:sequence>
#         <xsd:attribute name="label" type="xsd:string"/>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="Name" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="Phone" type="AnnotatedString" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Schedule" type="Schedule" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Uri" type="xsd:anyURI" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="label" type="xsd:string"/>
# </xsd:complexType>
module Vedaspace::ContactInformation
  extend ActiveSupport::Concern
  extend InclusionTracking
  include XsdFunctions  
  
  included do
    define_element("AddressLine")
    define_element("Directions", type: Vssc::InternationalizedText, belongs_to: true)
    define_element("Email")
    define_element("Fax")
    # TODO: Set up parsing for LatLng!
    define_element("Name")
    define_element("Phone")
    define_element("Schedule", type: Vssc::Schedule, method: :schedules)
  
    define_element("Uri")
  
    define_attribute("label")
  end
    
end