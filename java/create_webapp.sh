#! /bin/bash
#
# create_webapp.sh
# Copyright (C) 2014 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#


mvn archetype:create \
  -DgroupId=me.xuender.seapen \
  -DartifactId=seapen-web \
  -DarchetypeArtifactId=maven-archetype-webapp
