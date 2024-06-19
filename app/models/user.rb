class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :blog_posts, dependent: :destroy
  has_many :likes

  # Image upload
  has_one_attached :profile_image

  # Accessors
  attr_accessor :accept_terms

  # Validations
  validates :username, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :accept_terms, acceptance: true
  validates :profile_image, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validate :age_must_be_16_or_older

  # Callbacks
  before_save :downcase_email


  # Returns the full name
  def full_name
    "#{first_name} #{last_name}"
  end

  # Returns the age
  def age
    if date_of_birth.present?
      (Date.today - date_of_birth).to_i / 365
    end
  end

  private

  # Convert email to all lower-case
  def downcase_email
    self.email = email.downcase
  end

  # Age must be 16 or older
  def age_must_be_16_or_older
    if date_of_birth.present? && date_of_birth > 16.years.ago.to_date
      errors.add(:date_of_birth, 'You should be 16 years old or older.')
    end
  end
end
