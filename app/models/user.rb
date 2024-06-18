class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blog_posts, dependent: :destroy
  has_many :likes

  has_one_attached :profile_image

  validates :username, :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :date_of_birth, presence: true
  validates :terms_and_conditions, acceptance: true
  validate :date_of_birth_should_be_16_or_older

  def full_name
    "#{first_name} #{last_name}"
  end

  private
  def date_of_birth_should_be_16_or_older
    if self.date_of_birth.present? && self.date_of_birth > 16.years.ago.to_date
      errors.add(:date_of_birth, "must be 16 years or older")
    end
  end
end
