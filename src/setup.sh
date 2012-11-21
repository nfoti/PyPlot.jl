#!/usr/bin/env zsh
# File: setup.zsh
# Author: Junfeng Li <li424@mcmaster.ca>
# Description: start tmux session for julia
# Created: November 17, 2012

SESSION_NAME="IJulia"
infofile="/Users/ljunf/Documents/Projects/JuliaLab.jl/src/kernel.info"

tmux has-session -t $SESSION_NAME 2>/dev/null
if [ "$?" -eq 1 ]; then
    echo "No session found. Creating new one ..."
    tmux new-session -d -s $SESSION_NAME
    tmux send-keys "ipython qtconsole --pylab &>" $infofile " &" C-m
    tmux split-window -v 'julia'
    tmux send-keys "require(\"JuliaLab\")" C-m
else
    echo "Session found. Attaching ..."
fi

tmux attach -t $SESSION_NAME