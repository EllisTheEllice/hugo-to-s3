#!/bin/bash
OUTPATH=./s3out.txt
FILESPATH=./files.txt


hugo -D --minify
aws s3 sync public/ s3://$S3_BUCKET/ --size-only --exclude ".*" --dryrun > $OUTPATH
aws s3 sync public/ s3://$S3_BUCKET/ --size-only --exclude ".*"

if test -f "$OUTPATH"; then

  echo "Now invalidate..."
  cat $OUTPATH

  while IFS= read -r line
  do
    echo -n "$line" | sed "s/^.*upload: \(.*\) to.*/\"\1\" /" >> $FILESPATH
  done < "$OUTPATH"

  if test -f "$FILESPATH"; then
    echo "Send invalidation request..."
    echo "aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "$(cat $FILESPATH)
    aws cloudfront create-invalidation --distribution-id $ID --paths $(cat $FILESPATH)
  fi

fi

exit 0