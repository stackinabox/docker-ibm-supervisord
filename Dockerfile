FROM stackinabox/ibm-java:7.1-3.40

MAINTAINER Tim Pouyer <tpouyer@us.ibm.com>

# Pass in the location of the UCD agent install zip 
ARG ARTIFACT_DOWNLOAD_URL
ARG ARTIFACT_VERSION

RUN apt-get update && \
	apt-get install -qqy --no-install-recommends python-setuptools supervisor && \
	apt-get clean -y && \
	apt-get autoclean -y && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/*

# Add startup.sh script and addtional supervisord config
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD supervisord-startup.sh /bin/supervisord-startup.sh

ENTRYPOINT ["/bin/supervisord-startup.sh"]
CMD []