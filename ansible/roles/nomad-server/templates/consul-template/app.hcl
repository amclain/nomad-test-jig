template {
  source = "{{ nomad_data_dir }}/app.hcl.ctmpl"
  destination = "{{ nomad_data_dir }}/app.hcl"

  command = "nomad run {{ nomad_data_dir }}/app.hcl"
  command_timeout = "10m"
}
