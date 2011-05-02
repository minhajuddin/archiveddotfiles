alias mongod='/home/minhajuddin/apps/mongodb-linux-x86_64-1.6.5/bin/mongod --dbpath=/home/minhajuddin/dbs/'
alias mongo='/home/minhajuddin/apps/mongodb-linux-x86_64-1.6.5/bin/mongo'

alias g='gvim --remote-silent'

alias gitl='git log --graph --abbrev-commit --pretty=oneline --decorate'
alias gk='gitk --all'

alias r='rails'
alias nginx='sudo /etc/init.d/nginx'

alias d='dooby'
alias ps?='ps aux|grep'

alias be='bundle exec '

alias syns='synergys -c /etc/synergy.conf'
alias u='unicorn'
alias n='nautilus'
alias ru='kill -USR2 $(cat tmp/pids/unicorn.pid)'
alias ff='firefox'
alias chrome='/opt/google/chrome/chrome'
alias f='fg'
alias b='bg'
alias j='jobs'
alias hd='git push heroku $(git symbolic-ref -q HEAD):master'
