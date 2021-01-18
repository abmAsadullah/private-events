class EventAttendeesController < ApplicationController
    # def create
    #     @event = Event.find(params[:event_id])
    #     @event_attendee = @event.event_attendee.create[event_attendee_params]
    #     @event_attendee.user = current_user
    #     @event_attendee.save
    #     redirect_to event_path(@event)
    # end

    def create
		@event = Event.find(params[:event_attendee][:attended_event_id])
		current_user.attend!(@event)
		redirect_to @event
	end
end
