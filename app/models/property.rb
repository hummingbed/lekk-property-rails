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

    def self.findPropertiesWithToilet(propertyOwner)
        where(property_owner: propertyOwner)
    end

    def self.multiplePropertySearch(properties)
        where("property_address LIKE :search OR
            property_type LIKE :search OR
            CAST(number_of_bedrooms AS TEXT) LIKE :search OR
            CAST(number_of_sitting_rooms AS TEXT) LIKE :search OR
            CAST(number_of_kitchens AS TEXT) LIKE :search OR
            CAST(number_of_bathrooms AS TEXT) LIKE :search OR
            CAST(number_of_toilets AS TEXT) LIKE :search OR
            property_owner LIKE :search OR
            description LIKE :search",
        search: properties)
    end

    def self.findPropertiesWithAddress(addressValue)
        where(property_address: addressValue)
    end
end
