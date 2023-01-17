on add_leading_zeros(this_number, max_leading_zeros)
    return text (max_leading_zeros * -1) thru -1 of ("00000000000000000" & this_number)
end add_leading_zeros

if application "Spotify" is running then
  tell application "Spotify"
    set theName to name of the current track
    set theArtist to artist of the current track
    set theAlbum to album of the current track
    set theUrl to spotify url of the current track
	set trackTime to round((duration of current track) / 1000) rounding down
	set currentTime to player position
	set currentTime to round(currentTime) rounding down
	set trackTimeMin to round(trackTime / 60) rounding down
	set trackTimeSec to round(trackTime mod 60)
	set currentMin to round(currentTime / 60) rounding down
	set currentSec to round(currentTime mod 60)
    try
	  return "" & currentMin & ":" & my add_leading_zeros(currentSec, 2) & "/" & trackTimeMin & ":" & my add_leading_zeros(trackTimeSec, 2) & " ♫ " & theName & " - " & theArtist
    on error err
    end try
  end tell
end if
