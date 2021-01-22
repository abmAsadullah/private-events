require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'association' do
    it { should belong_to(:creator).class_name('User').with_foreign_key(:creator_id) }
    it { should have_many(:event_attendees).with_foreign_key(:attended_event_id) }
    it { should have_many(:attendees).through(:event_attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
  end
end
