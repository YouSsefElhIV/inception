#!/bin/bash

exec redis-server --requirepass ${REDIS_PASSWORD}
