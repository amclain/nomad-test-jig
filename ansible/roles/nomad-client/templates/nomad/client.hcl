client {
  enabled = true
  network_interface = "enp0s8"
  servers = ["{{ nomad_server_ip }}"]
}
