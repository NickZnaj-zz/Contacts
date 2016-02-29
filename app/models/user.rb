class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many(
    :contacts,
    class_name: 'Contact',
    dependent: :destroy,

    primary_key: :id,
    foreign_key: :user_id
  )

  has_many(
  :contact_shares,
  class_name: 'ContactShare',
  dependent: :destroy,
  primary_key: :id,
  foreign_key: :user_id
  )

  has_many(
  :shared_contacts,
  through: :contact_shares,
  source: :contact
  )
end
