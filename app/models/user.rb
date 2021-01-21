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

  def username
    m = self
    ret = m.email.split('@')[0]
    return ret
  end

  def attend!(event)
    p = self
    p.event_attendees.create!(attended_event_id: event.id)
  end
end
