class AdminUser < ActiveRecord::Base
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  scope :named, lambda {|first, last| where(:first_name => first, :last_name => last)}
end
