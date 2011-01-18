class SubscriptionsController < ApplicationController

  def create
    Subscription.create(params[:subscription])
    redirect_to '/', :notice => "Cheers! We'll be in touch."
  end

  def index
    @subscriptions = Subscription.search("@")
  end

end
