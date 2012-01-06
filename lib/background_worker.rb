
class BackgroundWorker

  def self.log_all_active_posts
    DBM.log_all_active_posts(:context=>:mabinogi)
    DBM.log_all_active_posts(:context=>:mabinogi_rec)
    DBM.log_all_active_posts(:context=>:mabinogiss)
    DBM.log_all_active_posts(:context=>:mabinogiss_rec)
    DBM.log_all_active_posts(:context=>:fez)
    DBM.log_all_active_posts(:context=>:pangya)
    DBM.log_all_active_posts(:context=>:paperman)
    DBM.log_all_active_posts(:context=>:cgf)
    DBM.log_all_active_posts(:context=>:latele)
  end

  def self.create_new_posts
    DBM.create_new_posts(:context=>:mabinogi)
    DBM.create_new_posts(:context=>:mabinogi_rec)
    DBM.create_new_posts(:context=>:mabinogiss)
    DBM.create_new_posts(:context=>:mabinogiss_rec)
    DBM.create_new_posts(:context=>:fez)
    DBM.create_new_posts(:context=>:pangya)
    DBM.create_new_posts(:context=>:paperman)
    DBM.create_new_posts(:context=>:cgf)
    DBM.create_new_posts(:context=>:latele)
  end

  def self.delete_inactive_posts
    DBM.delete_inactive_posts(:context=>:mabinogi)
    DBM.delete_inactive_posts(:context=>:mabinogi_rec)
    DBM.delete_inactive_posts(:context=>:mabinogiss)
    DBM.delete_inactive_posts(:context=>:mabinogiss_rec)
    DBM.delete_inactive_posts(:context=>:fez)
    DBM.delete_inactive_posts(:context=>:pangya)
    DBM.delete_inactive_posts(:context=>:paperman)
    DBM.delete_inactive_posts(:context=>:cgf)
    DBM.delete_inactive_posts(:context=>:latele)
  end

end
