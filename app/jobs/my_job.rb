class MyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Add your long-running task here
  end
end