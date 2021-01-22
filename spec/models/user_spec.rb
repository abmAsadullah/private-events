require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'association' do
      it { should have_many(:events).with_foreign_key(:creator_id) }
      it { should have_many(:event_attendees).with_foreign_key(:attendee_id) }
      it { should have_many(:attended_events).through(:event_attendees) }
    end
end