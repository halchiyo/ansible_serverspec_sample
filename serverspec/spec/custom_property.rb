def target_hostname
  hostname = Specinfra.backend.run_command('hostname').stdout.chop
  host = { hostname: hostname }
  host
end

def target_os_dist
  dist = Specinfra.backend.run_command("awk '{print $1}' /etc/redhat-release").stdout.chop
  property = { os: os }
  property[:os][:dist] = dist
  property
end

def custom_property
  property = {}
  property
    .merge(target_hostname)
    .merge(target_os_dist)
end