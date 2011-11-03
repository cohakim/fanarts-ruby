
set :output, { :error => 'log/error.log', :standard => 'log/cron.log' }

every 1.day, :at => '3:00 am' do
  runner 'DBM.log_all_active_posts(:context=>:mabinogi)'
  runner 'DBM.log_all_active_posts(:context=>:mabinogi_rec)'
  runner 'DBM.log_all_active_posts(:context=>:mabinogiss)'
  runner 'DBM.log_all_active_posts(:context=>:mabinogiss_rec)'
  runner 'DBM.log_all_active_posts(:context=>:fez)'
end

every 1.day, :at => '4:00 am' do
  runner 'DBM.create_new_posts(:context=>:mabinogi)'
  runner 'DBM.create_new_posts(:context=>:mabinogi_rec)'
  runner 'DBM.create_new_posts(:context=>:mabinogiss)'
  runner 'DBM.create_new_posts(:context=>:mabinogiss_rec)'
  runner 'DBM.create_new_posts(:context=>:fez)'
end

every 1.day, :at => '5:00 am' do
  runner 'DBM.delete_inactive_posts(:context=>:mabinogi)'
  runner 'DBM.delete_inactive_posts(:context=>:mabinogi_rec)'
  runner 'DBM.delete_inactive_posts(:context=>:mabinogiss)'
  runner 'DBM.delete_inactive_posts(:context=>:mabinogiss_rec)'
  runner 'DBM.delete_inactive_posts(:context=>:fez)'
end
