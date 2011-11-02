
class DBM
  
  def self.fugafuga
    all_sequences = FanArt.context(FanArt::CONTEXT_MABINOGI).map{|fanart| fanart.sequence }
    recommended_sequences = ActiveSupport::JSON.decode(
      Topic.find_by_topic(Topic::TOPIC_MABINOGI_RECOMMENDED).try(:sequences) || []
    )
    normal_sequences = all_sequences - recommended_sequences
    
    FanArt.context(FanArt::CONTEXT_MABINOGI).sequences(normal_sequences).each do |fanart|
      fanart.update_attribute(:url, FANART_DETAIL_URL % fanart.sequence)
    end
    
    FanArt.context(FanArt::CONTEXT_MABINOGI).sequences(recommended_sequences).each do |fanart|
      fanart.update_attribute(:url, FANART_RECOMENDED_DETAIL_URL % fanart.sequence)
    end
    
    true
  end
  
  def self.task_create_recommended_page(options = {})
    unless options[:dryrun] === false then options[:dryrun] = true; p 'druy run mode' end
    
    recommended_sequences = self.recommended_sequences(1, 2000)
    existed_sequences = FanArt.context(FanArt::CONTEXT_MABINOGI).sequences(recommended_sequences).map do |fanart|
      fanart.sequence
    end
    
    unless options[:dryrun]
      topic = Topic.find_or_create_by_topic(Topic::TOPIC_MABINOGI_RECOMMENDED)
      topic.update_attribute(:sequences, existed_sequences.to_json)
    end
    
    p existed_sequences.count if options[:dryrun]
    
    true
  end
  
  def self.task_create_retweet_page
  end
  
  def self.task_add_que(options = {})
    if options[:task].blank? then options[:task] = :newly end
    unless options[:dryrun] === false then options[:dryrun] = true; p 'druy run mode' end

    self.stats
    count = 0
    range = options[:task] == :fully ? 1..2000 : 1..10
    self.sequences(range.first, range.last).each do |sequence|
      if FanArt.find_by_context_id_and_sequence(FanArt::CONTEXT_MABINOGI, sequence).present?
        next
      end
      unless options[:dryrun]
        SequenceQue.find_or_create_by_context_id_and_sequence(
          :context_id => FanArt::CONTEXT_MABINOGI, :sequence => sequence
        )
      end
      count += 1
    end
    self.stats
    
    if options[:dryrun]
      p 'count: ' + count.to_s
    end
    
    true
  end

  #
  # おすすめファンアートの未登録シーケンスを処理対象にいれる
  # 一定期間で新着ファンアートから新着おすすめファンアートに移されるため
  # 一度同期しておけばあとは必要ないはず？
  #
  # def self.task_add_que2(options = {})
  #   if options[:task].blank? then options[:task] = :newly end
  #   unless options[:dryrun] === false then options[:dryrun] = true; p 'druy run mode' end
  # 
  #   self.stats
  #   count = 0
  #   range = options[:task] == :fully ? 1..2000 : 1..10
  #   self.recommended_sequences(range.first, range.last).each do |sequence|
  #     if FanArt.find_by_context_id_and_sequence(FanArt::CONTEXT_MABINOGI, sequence).present?
  #       next
  #     end
  #     unless options[:dryrun]
  #       SequenceQue.find_or_create_by_context_id_and_sequence(
  #         :context_id => FanArt::CONTEXT_MABINOGI, :sequence => sequence
  #       )
  #     end
  #     count += 1
  #   end
  #   self.stats
  #   
  #   if options[:dryrun]
  #     p 'count: ' + count.to_s
  #   end
  #   
  #   true
  # end
  
  def self.task_process_que(options = {})
    if options[:task].blank? then options[:task] = :single end
    unless options[:dryrun] === false then options[:dryrun] = true; p 'druy run mode' end
    
    self.stats
    
    limit = options[:task] == :fully ? SequenceQue.where('context_id = ?', [FanArt::CONTEXT_MABINOGI]).count : 1
    ques = SequenceQue.where('context_id = ?', [FanArt::CONTEXT_MABINOGI]) \
                      .where('error_count < ?', [3]) \
                      .limit(limit)

    count = 0
    ques.each do |que|
      count += 1
      if count == 1 || count % 10 == 0 then p "processing: #{limit.to_s}" end
      
      unless detail = self.detail(que.sequence)
        que.increment!(:error_count) unless options[:dryrun]
        que.update_attribute(:last_error, 'can not load detail') unless options[:dryrun]
        p 'can not load detail' if options[:dryrun]
        next
      end
      if FanArt.find_by_context_id_and_sequence(FanArt::CONTEXT_MABINOGI, que.sequence).present?
        que.increment!(:error_count) unless options[:dryrun]
        que.update_attribute(:last_error, 'sequence already existed') unless options[:dryrun]
        p 'sequence already existed' if options[:dryrun]
        next
      end
      
      detail = detail.merge({ :context_id => FanArt::CONTEXT_MABINOGI })
      FanArt.create!(detail)  unless options[:dryrun]
      que.delete unless options[:dryrun]
      
      sleep(0.3)
    end
    
    self.stats
    
    true
  end
  
  def self.broken_ques(options = {})
    ques = SequenceQue.where('context_id = ?', [FanArt::CONTEXT_MABINOGI]).where('error_count > ?', [3])
    p 'count: ' + ques.count.to_s
    
    if options[:list].present?
      limit = options[:limit].present? ? [options[:limit], ques.count].min : 10
      limit.times do |i|
        p "[#{ques[i].id.to_s}] " + ques[i].last_error
      end
    end
    true
  end

  def self.stats
    p 'FanArt: ' + FanArt.where(:context_id => FanArt::CONTEXT_MABINOGI).count.to_s
    p 'SequenceQue: ' + SequenceQue.where(:context_id => FanArt::CONTEXT_MABINOGI).count.to_s
    true
  end
  
end