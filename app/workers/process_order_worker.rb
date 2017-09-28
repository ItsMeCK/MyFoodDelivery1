class ProcessOrderWorker
  include Sidekiq::Worker

  def perform(object_id, action)
  	Order.process_order(object_id)
  end
end