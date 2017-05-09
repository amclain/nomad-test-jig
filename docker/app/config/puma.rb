port ENV.fetch("NOMAD_PORT_http", 8080).to_i
threads 1, 1
workers 4
quiet false # Print request log to stdout
preload_app!
