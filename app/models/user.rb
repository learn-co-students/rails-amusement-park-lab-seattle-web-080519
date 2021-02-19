class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # validates_presence_of :name, :password, :happiness, :nausea, :height, :tickets

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    end
  end

end
