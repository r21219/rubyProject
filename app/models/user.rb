class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :only_admin, -> { where(admin: true) }
  validates :name, presence: true
  validates :surname, presence: true
  validates :admin, inclusion: { in: [true, false] }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }

  def admin?
    admin
  end

  def to_s
    "#{name} #{surname}"
  end
end
