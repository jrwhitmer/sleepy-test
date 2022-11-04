if [ -z "$SLEEPY_DURATION" ]; then
  SLEEPY_DURATION="300"
fi

echo "Sleeping for $SLEEPY_DURATION seconds...."
sleep $SLEEPY_DURATION

if [ -z "$NETLIFY_API_HOST" ]; then
  NETLIFY_API_HOST="api.netlify.com"
fi

if [ -z "$BUILD_HOOK_ID" ]; then
  BUILD_HOOK_ID="NO_BUILD_HOOK_ID_PROVIDED"
fi

echo "Writing index.html..."
cat index.html.template | \
  sed "s#https://NETLIFY_API_HOST/build_hooks/BUILD_HOOK_ID#https://$NETLIFY_API_HOST/build_hooks/$BUILD_HOOK_ID#g" \
  > index.html
echo "Wrote index.html"
