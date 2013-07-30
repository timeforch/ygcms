listen 9080# by default Unicorn listens on port 8080
worker_processes 8
working_directory "/data/rubyapp/ygcms"
listen "/var/run/.unicorn.sock", :backlog => 64
stderr_path "/data/applogs/unicornlogs/unicorn.stderr.log"
stdout_path "/data/applogs/unicornlogs/unicorn.stdout.log"
pid "/var/run/unicorn.pid"


