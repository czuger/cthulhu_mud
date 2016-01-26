# Set the working application directory
# working_directory '/path/to/your/app'
working_directory '/var/www/cthulhu_mud/current'

# Unicorn PID file location
# pid '/path/to/pids/unicorn.pid'
pid '/var/www/cthulhu_mud/current/tmp/pids/unicorn.pid'

# Path to logs
# stderr_path '/path/to/log/unicorn.log'
# stdout_path '/path/to/log/unicorn.log'
stderr_path '/var/www/cthulhu_mud/current/log/unicorn.err'
stdout_path '/var/www/cthulhu_mud/current/log/unicorn.log'

# Unicorn socket
listen '/tmp/unicorn.cthulhu_mud.sock'

# Number of processes
# worker_processes 4
worker_processes 1

# Time-out
timeout 30