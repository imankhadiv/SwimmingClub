class Address < ActiveRecord::Base
  belogns_to :addressable, polymorphic: true
end
