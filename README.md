# hugobuilder

Dockerimage containing Hugo as well as aws cli. The main purpose of this image is to automatically transfer generated hugo page to an AWS S3 Bucket.

# Usage
docker run --rm -v \<local-volume>:/src -e AWS_ACCESS_KEY_ID=\<aws-access-key> -e AWS_SECRET_ACCESS_KEY=\<aws-secret> -e S3_BUCKET=\<bucketname> -e DISTRIBUTION_ID=\<dist-id> ellistheellice/hugobuilder:latest

## Sources
Hugo will take source code located at /src to genrate the output. The above example illustrates how to mount a local directoy into the containers /src directory.

## Environment variables
The supported environment variables are:
-  **AWS_ACCESS_KEY_ID**: The access key of the target AWS account
-  **AWS_SECRET_ACCESS_KEY**: The corresponding secret to the above mentioned access key
-  **S3_BUCKET**: The target S3 bucket
-  **DISTRIBUTION_ID**: The distribution id to invalidate requests
