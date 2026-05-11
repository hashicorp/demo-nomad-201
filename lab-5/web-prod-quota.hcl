# Copyright IBM Corp. 2019, 2026

name = "web-prod-quota"
description = "limit the web-prod namespace"

# Create a limit for the global region. Additional limits may
# be specified in-order to limit other regions.
limit {
    region = "global"
    region_limit {
        memory = 250
    }
}
