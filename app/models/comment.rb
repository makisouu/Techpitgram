class Comment < ApplicationRecord
  belongs_to :post # この行を追加する
  belongs_to :user # この行を追加する
end
