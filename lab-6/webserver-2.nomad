# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

job "webserver-2" {
  datacenters = ["dc1"]
  type        = "service"
  namespace   = "web-prod"
  priority    = 75

  group "webserver-2" {
    count = 2

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
        memory  = 3500
      }

      service {
        name = "webserver-2"
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
