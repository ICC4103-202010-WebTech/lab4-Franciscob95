class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # TODO: complete the folowing
  after_save :update_stats
  after_destroy :update_stats2

  private
  def update_stats
    es = self.ticket_type.event.event_stat
    es.tickets_sold += 1
  end
  def update_stats2
    es = self.ticket_type.event.event_stat
    es.tickets_sold -= 1
  end
end
