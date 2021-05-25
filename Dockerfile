FROM ubuntu

RUN apt-get update && apt-get install -y curl zip unzip && apt-get clean

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl -s "https://get.sdkman.io" | bash
RUN chmod a+x /root/.sdkman/bin/sdkman-init.sh
RUN source "/root/.sdkman/bin/sdkman-init.sh" \
 && sdk install sbt && sdk install java 11.0.11-open \
 && mkdir test-project && cd test-project && sbt update && cd / && rm -r test-project
