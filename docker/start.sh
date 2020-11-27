#!/bin/bash
OUTPATH=../s3out.txt
FILESPATH=../files.txt
OUTPUTFOLDER=public


hugo -D --minify
cd $OUTPUTFOLDER
#aws s3 sync . s3://$S3_BUCKET/ --size-only --exclude ".*"  --dryrun > $OUTPATH
aws s3 sync . s3://$S3_BUCKET/ --size-only --exclude ".*" --delete
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths /*
#test if the outputfile exists. Only if it does, proceed
#if test -f "$OUTPATH"; then
#
#  grep . "$OUTPATH" | while read line
#  do
#    echo -n "$line" | sed "s/^.*upload: \(.*\) to.*/\"\/\1\" /" | sed "s/^\"\/\.\(.*\)\"/\"\1\"/" >> $FILESPATH
#  done
#
#  #test if filespath exists and contains the list of files to invalidate. Only if it exists, proceed
#  if test -f "$FILESPATH"; then
#    cat $FILESPATH
#    echo "Send invalidation request..."
#    echo "aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "$(cat $FILESPATH)
#    aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths $(cat $FILESPATH)
#  fi
#
#fi

exit 0