namespace :nginx do
  desc "Process routes"
  task :create_regexp => :environment do
    root_routes = []
    Rails.application.routes.routes.each do |route|
      root_route = route.path.spec.to_s.gsub( /\(.*\)/, '' ).split( '/' )
      root_routes << root_route[ 1 ] unless root_route.empty?
    end
    root_routes.uniq!
    root_routes.reject!{ |e| e == 'assets' || e == 'rails' }

    routes_regexp = '^\/$|' + root_routes.map{ |e| "\/#{e}.*" }.join( '|' )
    routes_regexp = "location ~ (#{routes_regexp})"
    puts routes_regexp
  end
end
