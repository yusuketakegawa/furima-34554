class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, precense: true
  validates :emali,    precense: true
  validates :email,    unique:  true
  validates :email, precense: true
  validates :email, inclusion: {in: %w(@) }
  validates :encrypted_password, precense: true
  validates :encrypted_password, length: {minimum: 6 }
  validates :encrypted_password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  validates :password_confirmation, password:true
  validates :last_name,     precense: true
  validates :first_name,    precense: true
  validates :last_name_kana,precense: true
  validates :fitst_name_kana,precense: true


end
