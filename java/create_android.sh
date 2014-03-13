#! /bin/bash
#
# create_webapp.sh
# Copyright (C) 2014 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#

mvn archetype:generate \
  -Dplatform=16 \
  -DarchetypeArtifactId=android-quickstart \
  -DarchetypeGroupId=de.akquinet.android.archetypes \
  -DarchetypeVersion=1.0.11 \
  -DgroupId=me.xuender \
  -DartifactId=ab-fp \
  -Dpackage=me.xuender.audiobooks.fp
