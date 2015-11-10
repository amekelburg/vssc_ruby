module Vedaspace::BallotStyleGpUnitIdRef
  extend InclusionTracking
  extend ActiveSupport::Concern
  include XsdFunctions  
  
  included do  
    self.node_name = 'BallotStyleGpUnitIdRef'
    define_text_node(:gp_unit_id_ref)
  end
end