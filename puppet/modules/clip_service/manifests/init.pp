class clip_service () {
  class{'clip_service::packages':} ->
  class{'clip_service::directories':} ->
  class{'clip_service::redis':} ->
  class{'clip_service::gocode':} ->
  class{'clip_service::nginx':}
}
