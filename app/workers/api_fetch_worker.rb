class ApiFetchWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options retry: false

  recurrence { minutely(10) }

  def perform
    getAvailability()
  end
  
  def getAvailability
    url = URI.parse('http://fw-rubycodetest.herokuapp.com/api/v1/lounges/availability')
    req = Net::HTTP::Get.new(url.to_s)
    req["Authorization"] = "KA7LQ67rzkPThLwUwUG4GyGkN"
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    if res.content_type == "text/html"
      getAvailability()
    else
      legacy_availability = JSON.parse(res.body)
      Availability.delete_all
      legacy_availability.each do |legacy_lounge|
        lounge = Lounge.where(["feed_id = ?", legacy_lounge["lounge_id"]]).first
        
        legacy_lounge["availability"].each do |date|
          availability = Availability.create(lounge_id: lounge.id, date: date["date"], remaining: date["remaining"])
        end
      end
    end
  end
end


