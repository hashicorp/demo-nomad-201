job "webserver" {
  datacenters = ["dc1"]
  type        = "service"
  namespace   = "web-prod"

  migrate {
    max_parallel = 2
    health_check = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

  group "webserver" {
    count = 10

    task "apache" {
      driver = "docker"

      config {
        image = "httpd:latest"

        port_map {
          http = 80
        }
      }

      resources {
        network {
          mbits = 10
          port  "http"{}
        }
      }

      service {
        name = "webserver"
        port = "http"

        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
