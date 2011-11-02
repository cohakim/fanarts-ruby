
class DBM
    
  def self.log_all_active_posts(options = {})
    context = options[:context]
    unless FanArt::CONTEXT.has_key?(context) then p 'unsupported context'; return false end

    active_sequences  = api(context).sequences(1, 2000)
    Topic.create!(:topic => FanArt::CONTEXT[context], :sequences => active_sequences)
    
    nil
  end
  
  def self.create_new_posts(options = {})
    context = options[:context]
    unless FanArt::CONTEXT.has_key?(context) then p 'unsupported context'; return false end
    
    self.create_ques_for_new_posts(options)
    self.process_ques_for_new_posts(options)
    
    nil
  end
  
  def self.delete_inactive_posts(options = {})
    context = options[:context]
    unless FanArt::CONTEXT.has_key?(context) then p 'unsupported context'; return false end

    active_sequences   = Topic.topic(FanArt::CONTEXT[context]).last.sequences
    stored_sequences   = lambda {
      FanArt.context(FanArt::CONTEXT[context]).map{|i| i.sequence }
    }.call
    inactive_sequences = stored_sequences - active_sequences
    
    FanArt.context(FanArt::CONTEXT[context]).sequences(inactive_sequences).delete_all
    
    nil
  end

  ############################################################################

  def self.create_ques_for_new_posts(options = {})
    context = options[:context]
    unless FanArt::CONTEXT.has_key?(context) then p 'unsupported context'; return false end

    active_sequences  = Topic.topic(FanArt::CONTEXT[context]).last.sequences
    stored_sequences  = lambda {
      FanArt.context(FanArt::CONTEXT[context]).map{|i| i.sequence } \
        && SequenceQue.context(FanArt::CONTEXT[context]).map{|i| i.sequence }
    }.call
    new_sequences     = active_sequences - stored_sequences
    
    new_sequences.map do |sequence|
      SequenceQue.create!({ :context_id => FanArt::CONTEXT[context], :sequence => sequence })
    end
    
    nil
  end
  
  def self.process_ques_for_new_posts(options = {})
    context = options[:context]
    unless FanArt::CONTEXT.has_key?(context) then p 'unsupported context'; return false end

    SequenceQue.context(FanArt::CONTEXT[context]).each do |que|
      begin
        detail = api(context).detail(que.sequence).merge({ :context_id => FanArt::CONTEXT[context] })
        FanArt.create!(detail)
        que.delete
      rescue => ex
        que.increment!(:error_count)
        que.update_attribute(:last_error, ex.message)
        next
      end
    end
    
    nil
  end

  ############################################################################
  protected
  
  def self.api(context)
    api = nil
    case context
    when :mabinogi
      api = API::Mabinogi.new
    when :mabinogi_rec
      api = API::MabinogiRec.new
    when :mabinogiss
      api = API::MabinogiSS.new
    when :mabinogiss_rec
      api = API::MabinogiSSRec.new
    when :fez
      api = API::Fez.new
    end
    api
  end

end