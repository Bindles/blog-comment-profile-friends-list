class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    # Associations
  has_many :posts
  has_many :comments, as: :commentable
  has_one :profile, dependent: :destroy
  after_create :create_associated_profile

  
  has_many :friendships
  has_many :friends, through: :friendships

  private

    def create_associated_profile
      build_profile(id: id)
    end
end
