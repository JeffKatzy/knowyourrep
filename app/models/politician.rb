class Politician < ApplicationRecord
  has_one :representative_seat
  has_one :senator_seat
  has_many :messages
  belongs_to :state

  def full_name
  	[first_name, last_name].join(' ')
  end

  def age
  	Time.now.year - birth_year
  end

  def senate_or_house
  	representative_seat.nil? ? senate : house
  end

  def senate
  	'Member of the United States Senate'
  end

  def house
  	"Member of the United States House of Representatives from #{state.name}'s 
  		#{representative_seat.district.name.to_i.ordinalize} district"
  end
end
