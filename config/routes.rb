FanArts::Application.routes.draw do
  match '/arts/mabinogi/fanart/newly/:page'        => 'arts#mabinogi_fa_newly'
  match '/arts/mabinogi/fanart/recommended/:page'  => 'arts#mabinogi_fa_recommended'
  match '/arts/mabinogi/fanart/random/:page'       => 'arts#mabinogi_fa_random'
  match '/arts/mabinogi/ss/newly/:page'            => 'arts#mabinogi_ss_newly'
  match '/arts/mabinogi/ss/recommended/:page'      => 'arts#mabinogi_ss_recommended'
  match '/arts/mabinogi/ss/random/:page'           => 'arts#mabinogi_ss_random'
  match '/arts/fez/fanart/newly/:page'             => 'arts#fez_fa_newly'
  match '/arts/fez/fanart/random/:page'            => 'arts#fez_fa_random'
  match '/arts/pangya/fanart/newly/:page'          => 'arts#pangya_fa_newly'
  match '/arts/pangya/fanart/random/:page'         => 'arts#pangya_fa_random'
  match '/arts/pangya/ss/newly/:page'              => 'arts#pangya_ss_newly'
  match '/arts/pangya/ss/random/:page'             => 'arts#pangya_ss_random'
  match '/arts/paperman/fanart/newly/:page'        => 'arts#paperman_fa_newly'
  match '/arts/paperman/fanart/random/:page'       => 'arts#paperman_fa_random'
  match '/arts/cgf/fanart/newly/:page'             => 'arts#cgf_fa_newly'
  match '/arts/cgf/fanart/random/:page'            => 'arts#cgf_fa_random'
  match '/arts/latele/fanart/newly/:page'          => 'arts#latele_fa_newly'
  match '/arts/latele/fanart/random/:page'         => 'arts#latele_fa_random'
  match '/arts/maple_story/fanart/newly/:page'     => 'arts#maple_story_fa_newly'
  match '/arts/maple_story/fanart/random/:page'    => 'arts#maple_story_fa_random'
end
