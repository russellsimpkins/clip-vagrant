class clip_service () {
    class{'clip_service::packages':} ->
    class{'clip_service::directories':} ->
    class{'clip_service::nginx':} ->
    class{'clip_service::redis':}
}
