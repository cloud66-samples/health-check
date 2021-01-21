class HealthController < ApplicationController

  HEALTH_UNAVAILABLE_FOR = ENV.fetch("HEALTH_UNAVAILABLE_FOR", "10").to_i.seconds

  def health
    @@time_controller_first_hit ||= DateTime.now
    return render nothing: true, status: :service_unavailable if DateTime.now <= @@time_controller_first_hit + HEALTH_UNAVAILABLE_FOR
    return render nothing: true
  end

  def healthz
    return render nothing: true
  end
end
