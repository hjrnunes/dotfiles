# Set global color styles, for example:
#
# function hjrnunes_error
#   set_color -o red
# end
#
# function hjrnunes_normal
#   set_color normal
#

function fish_greeting -d "what's up, fish?"
  set_color $fish_color_autosuggestion[1]
  uname -npsr
  uptime
  set_color normal
end
