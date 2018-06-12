class Poly::Post < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :postable, polymorphic: true
end
