# Git Functions
function _gc { git commit -am "$*"; }
function _gri { git rebase -i $* ; }
function _gr { git rebase $*; }
