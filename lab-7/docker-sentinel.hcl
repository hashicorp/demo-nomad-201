# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Policy to only allows Docker based tasks
main = rule { all_drivers_docker }

# all_drivers_docker checks that all the drivers in use are Docker
all_drivers_docker = rule {
    all job.task_groups as tg {
        all tg.tasks as task {
            task.driver is "docker"
        }
    }
}
