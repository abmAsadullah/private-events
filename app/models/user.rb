class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: :creator_id
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees


  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ? ', DateTime.now) }
  # def upcoming_events
  #   self.attended_events.upcoming
  # end

  # def prev_events
  #   self.attended_events.past
  # end
  def username
    return self.email.split('@')[0]
  end

  def attend!(event)
    self.event_attendees.create!(attended_event_id: event.id)
  end
end
