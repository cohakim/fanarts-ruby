FanArts::Application.routes.draw do
  match '/arts/mabinogi/fanart/newly/:page', :controller => 'arts', :action => 'mabinogi_fa_newly'
  match '/arts/mabinogi/fanart/recommended/:page', :controller => 'arts', :action => 'mabinogi_fa_recommended'
  match '/arts/mabinogi/fanart/retweeted/:page', :controller => 'arts', :action => 'mabinogi_fa_retweeted'
  match '/arts/mabinogi/fanart/random/:page', :controller => 'arts', :action => 'mabinogi_fa_random'
  match '/arts/mabinogi/ss/newly/:page', :controller => 'arts', :action => 'mabinogi_ss_newly'
  match '/arts/mabinogi/ss/recommended/:page', :controller => 'arts', :action => 'mabinogi_ss_recommended'
  match '/arts/mabinogi/ss/retweeted/:page', :controller => 'arts', :action => 'mabinogi_ss_retweeted'
  match '/arts/mabinogi/ss/random/:page', :controller => 'arts', :action => 'mabinogi_ss_random'
  match '/arts/fez/fanart/newly/:page', :controller => 'arts', :action => 'fez_fa_newly'
  match '/arts/fez/fanart/retweeted/:page', :controller => 'arts', :action => 'fez_fa_retweeeted'
  match '/arts/fez/fanart/random/:page', :controller => 'arts', :action => 'fez_fa_random'
end
