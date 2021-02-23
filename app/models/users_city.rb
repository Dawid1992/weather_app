class UsersCity < ApplicationRecord
  belongs_to :user ,optional: true
end
