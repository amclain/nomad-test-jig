bind_addr = "0.0.0.0"
data_dir = "{{ nomad_data_dir }}"
enable_debug = true

advertise {
  http = "{{ ansible_enp0s8.ipv4.address }}"
  serf = "{{ ansible_enp0s8.ipv4.address }}"
  rpc = "{{ ansible_enp0s8.ipv4.address }}"
}
