# Container image that runs your code
FROM quay.io/saucelabs/piestry:latest

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY specs /specs

WORKDIR /usr/src/app
# EXPOSE 5000
# USER sauce

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["node","index.js","--logger https://${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}@api.${SAUCE_DC}.saucelabs.com/api-testing/rest/v4/${SAUCE_APIT_HOOK_ID}/logger -u /specs/myspec.yaml"]

