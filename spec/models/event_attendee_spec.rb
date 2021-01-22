require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  describe 'association' do
    it { should belong_to(:attendee).class_name('User') }
    it { should belong_to(:attended_event).class_name('Event') }
  end
  describe 'validations' do
    it { should validate_presence_of(:attendee_id) }
    it { should validate_presence_of(:attended_event_id) }
  end
end
