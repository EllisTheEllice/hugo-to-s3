#!/bin/bash

hugo -D --minify
aws s3 sync public/ s3://$S3_BUCKET/ --size-only --exclude ".*"

exit 0
