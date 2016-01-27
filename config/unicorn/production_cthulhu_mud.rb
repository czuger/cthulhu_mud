# Set the working application directory
# working_directory '/path/to/your/app'
working_directory '/var/www/cthulhu_mud/prod/current'

# Unicorn PID file location
# pid '/path/to/pids/unicorn.pid'
pid '/var/www/cthulhu_mud/prod/current/tmp/pids/unicorn.pid'

# Path to logs
# stderr_path '/path/to/log/unicorn.log'
# stdout_path '/path/to/log/unicorn.log'
stderr_path '/var/www/cthulhu_mud/prod/current/log/unicorn.err'
stdout_path '/var/www/cthulhu_mud/prod/current/log/unicorn.log'

# Unicorn socket
listen '/var/www/cthulhu_mud/prod/current/tmp/unicorn.sock'

# Number of processes
# worker_processes 4
worker_processes 1

# Time-out
timeout 30