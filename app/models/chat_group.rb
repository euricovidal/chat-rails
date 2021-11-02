class ChatGroup < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
