datacenter = "local1"
data_dir   = "/opt/consul"
encrypt = "aVLaAcEkrBkC0aTVWkWZgQ=="
log_level = "INFO"
enable_syslog = true
retry_join = ["10.1.42.202"]
performance {
       raft_multiplier = 1
}
client_addr = "0.0.0.0"
