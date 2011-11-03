
set :output, { :error => 'log/error.log', :standard => 'log/cron.log' }

every 1.day, :at => '3:00 am' do
  runner 'BackgroundWorker.log_all_active_posts'
end

every 1.day, :at => '4:00 am' do
  runner 'BackgroundWorker.create_new_posts'
end

every 1.day, :at => '5:00 am' do
  runner 'BackgroundWorker.delete_inactive_posts'
end
