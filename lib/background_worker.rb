
class BackgroundWorker
  
  def self.log_all_active_posts
    DBM.log_all_active_posts(:context=>:mabinogi)
    DBM.log_all_active_posts(:context=>:mabinogi_rec)
    DBM.log_all_active_posts(:context=>:mabinogiss)
    DBM.log_all_active_posts(:context=>:mabinogiss_rec)
    DBM.log_all_active_posts(:context=>:fez)
  end
  
  def self.create_new_posts
    DBM.create_new_posts(:context=>:mabinogi)
    DBM.create_new_posts(:context=>:mabinogi_rec)
    DBM.create_new_posts(:context=>:mabinogiss)
    DBM.create_new_posts(:context=>:mabinogiss_rec)
    DBM.create_new_posts(:context=>:fez)
  end

  def self.delete_inactive_posts
    DBM.delete_inactive_posts(:context=>:mabinogi)
    DBM.delete_inactive_posts(:context=>:mabinogi_rec)
    DBM.delete_inactive_posts(:context=>:mabinogiss)
    DBM.delete_inactive_posts(:context=>:mabinogiss_rec)
    DBM.delete_inactive_posts(:context=>:fez)
  end
  
end
