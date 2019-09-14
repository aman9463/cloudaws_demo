class AwsOfferCodePrice < ApplicationRecord
# associations
belongs_to :offer_code_update_status
belongs_to :currency, foreign_key: 'currency_id', class_name: 'MasterCurrency'

# validations
validates :offer_code_update_status_id, presence: true
end
