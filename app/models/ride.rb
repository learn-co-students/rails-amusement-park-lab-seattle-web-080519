class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  validates_presence_of :user_id, :attraction_id

  def take_ride
    if !enough_tickets && !enough_height
      "Sorry. #{ticket_message} #{height_message}"
    elsif !enough_tickets
      "Sorry. #{ticket_message}"
    elsif !enough_height
      "Sorry. #{height_message}"
    else
      go_ride
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def enough_height 
    self.user.height >= self.attraction.min_height
  end

  def go_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
    self.user.update(happiness: new_happiness, 
      tickets: new_tickets, 
      nausea: new_nausea)
  end

  def ticket_message
    "You do not have enough tickets the #{self.attraction.name}."
  end

  def height_message
    "You are not tall enough to ride the #{self.attraction.name}."
  end

end
