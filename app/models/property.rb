class Property < ApplicationRecord

    validates :property_address, :property_type, :number_of_bedrooms, :number_of_sitting_rooms,
    :number_of_kitchens, :number_of_bathrooms, :number_of_toilets, :property_owner, :description,
    :valid_from, :valid_to, presence: true

    validates :number_of_bedrooms, :number_of_sitting_rooms,
    :number_of_kitchens, :number_of_bathrooms, :number_of_toilets,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    validates :property_owner, :property_type, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
    validates :property_address, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers, and spaces" }

    validates :valid_from, :valid_to, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format yyyy-mm-dd" }
    validate :valid_to_not_less_than_valid_from

    def valid_to_not_less_than_valid_from
      if valid_to.present? && valid_from.present? && valid_to < valid_from
        errors.add(:valid_to, "must be greater than or equal to Valid from")
      end
    end

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
