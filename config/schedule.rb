
set :output, { :error => 'log/error.log', :standard => 'log/cron.log' }

every 1.day, :at => '3:00 am' do
  runner 'DBM.log_all_active_posts(:context=>:mabinogi)'
end


