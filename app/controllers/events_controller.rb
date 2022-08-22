# frozen_string_literal: true

# Event class for creating events
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event details was Added successfully.'
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    authorize @event
  end

  def edit
    authorize @event
  end

  def update
    authorize @event
    if @event.update(event_params)
      flash[:notice] = 'Event updated successfully.'
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
