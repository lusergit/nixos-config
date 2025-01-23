# fish-modus-operandi color theme

set -l foreground 000000 # fg-main
set -l comment 595959 # fg-alt
set -l selection bdbdbd # blue-active
# *-intense color
set -l red a60000
set -l orange 6f5500
set -l green 006800
set -l yellow 6f5500
set -l blue 0031a9
set -l magenta 721045
set -l purple 531ab6
set -l cyan 005e8b

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $purple
set -g fish_color_keyword $magenta
set -g fish_color_quote $blue
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $cyan
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $magenta
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
