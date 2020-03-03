function fish_prompt
    set -l namecol  white
    set -l dircol green
    set -l branchcol purple
    # Print username:
    set_color $namecol -b normal
    echo -n (whoami)":"

    # Print git_branch_name
    set_color $branchcol -b normal
    echo -n (git rev-parse --abbrev-ref HEAD 2>/dev/null)

    # Print a ":"
    set_color $namecol -b normal
    echo -n ":"

    # Print current directory
    set_color $dircol -b normal
    set working_dir (echo $PWD | sed -e "s|^$HOME|~|")
    echo -n "$working_dir"

    # Print a ">"
    set_color $namecol
    echo -n ">"
end

function set_title
    set -gx TITLE $argv[1]
    function fish_title
        echo $TITLE
    end
end


# Alias definitions.
alias back 'prevd'
alias forth 'nextd'

set PATH /home/jeff/.local/bin $PATH
set PATH /home/jeff/gems/bin $PATH
set -gx GEM_HOME /home/jeff/gems
set -gx DOCKER_HOST tcp://localhost:2375
set -gx PIPENV_MAX_DEPTH 10
set -gx AWS_PROFILE vuemgmt-cdpipeline

# Fundle plugins
fundle plugin 'sentriz/fish-pipenv'


fundle init
