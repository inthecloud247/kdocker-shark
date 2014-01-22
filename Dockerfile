FROM inthecloud247/kdocker-openjdk7
MAINTAINER John Albietz "inthecloud247@gmail.com"

# # openjdk7
# RUN apt-get -y install --no-install-recommends openjdk-7-jdk

# # set JAVA_HOME
# ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN \
  `# Create cache directory`; \
  DIR_CACHE="/setupfiles/cache/"; \
  mkdir -vp $DIR_CACHE; \
  \
  `############################`; \
  `# CUSTOM COMMANDS HERE`; \
  `############################`; \
  cd $DIR_CACHE; \
  wget --no-check-certificate http://www.scala-lang.org/files/archive/scala-2.9.3.tgz; \
  wget --no-check-certificate https://github.com/amplab/shark/releases/download/v0.8.0/shark-0.8.0-bin-cdh4.tgz;

RUN \
  DIR_CACHE="/setupfiles/cache/"; \
  cd $DIR_CACHE; \
  tar -xvf scala-*.tgz -C /opt; \
  tar -xvf shark-*-bin*.tgz -C /opt;

RUN \
  cd /opt; \
  cd shark-*-bin-*; \
  cp shark-0.8.0/conf/shark-env.sh.template shark-0.8.0/conf/shark-env.sh; \
  mv *.tgz /setupfiles \
  `############################`; \
  `# CLEANUP`; \
  `############################`; \
  rm -vrf /setupfiles;
