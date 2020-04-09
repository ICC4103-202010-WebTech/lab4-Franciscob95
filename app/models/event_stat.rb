class EventStat < ApplicationRecord
  belongs_to :event

  before_save :tickets_lower_venue_capacity

  private
  def tickets_lower_venue_capacity
    if self.tickets_sold > self.event.event_venue.capacity
      errors.add(:self.tickets_sold, "The capacity is already at it's full")
    end
  end
end
