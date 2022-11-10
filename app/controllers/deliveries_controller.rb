class DeliveriesController < ApplicationController
  require "date"

  @today = Date.today
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index.html.erb" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("query_description")
    the_delivery.arrival_date = params.fetch("query_arrival_date")
    the_delivery.details = params.fetch("query_details")
    the_delivery.status = "waiting on"
    the_delivery.owner_id = @current_user.id

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Added to list" })
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    # the_delivery.description = params.fetch("query_description")
    # the_delivery.arrival_date = params.fetch("query_arrival_date")
    # the_delivery.details = params.fetch("query_details")
    # the_delivery.owner_id = params.fetch("query_owner_id")
    has_arrived = params.fetch("arrived")

    if has_arrived
      the_delivery.status = "delivered"
    end

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery updated successfully."} )
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
