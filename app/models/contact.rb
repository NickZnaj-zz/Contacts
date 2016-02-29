class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, :uniqueness => {:scope => :user_id}
  validates :user_id, presence: true

  belongs_to(
    :owner,
    class_name: 'User',

    primary_key: :id,
    foreign_key: :user_id
  )

  has_many(
  :contact_shares,
  class_name: 'ContactShare',
  primary_key: :id,
  foreign_key: :contact_id
  )

  has_many(
  :shared_users,
  through: :contact_shares,
  source: :user
  )
end
