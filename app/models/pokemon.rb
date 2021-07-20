class Pokemon < ApplicationRecord
    validates :name, presence :true
    validates :img_url, presence :true
    validates :type, presence :true
    validates :weight, presence :true
    validates :ability, presence :true
end
