class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :remove_dash_from_phone

  validates_presence_of :phone

  def remove_dash_from_phone
    self.phone = phone.gsub '-','' if phone
  end
end
