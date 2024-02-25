class BuyShippingInformation
  include ActiveModel::Model
    attr_accessor :postcode, :prefecture_id, :municipalities, :block, :building, :phone_number, :buy_id, :user_id, :item_id, :token

    with_options presence: true do
    validates :postcode, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" } 
    validates :municipalities, :block 
    validates :phone_number, format: {with: /\A\d+\z/, message: "is invalid. Input only number"}, 
    length: { minimum: 10, maximum: 11, message: "is too short" }
    validates :user_id, :item_id
    end
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :token, presence: true
    
    def save
      buy = Buy.create(user_id: user_id, item_id: item_id)
      ShippingInformation.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, block: block, building: building, phone_number: phone_number, buy_id: buy.id)
    end
end