class Property < ApplicationRecord

      validates :property_address, presence: true
      validates :property_type, presence: true
      validates :number_of_bedrooms, presence: true
      validates :number_of_sitting_rooms, presence: true
      validates :number_of_kitchens, presence: true
      validates :number_of_bathrooms, presence: true
      validates :number_of_toilets, presence: true
      validates :property_owner, presence: true
      validates :description, presence: true
      validates :valid_from, presence: true
      validates :valid_to, presence: true

    def self.find_properties_with_toilet(toilet_value)
        where(property_owner: toilet_value)
    end

    def self.find_properties_with_address(address_value)
        where(property_address: address_value)
    end
end
