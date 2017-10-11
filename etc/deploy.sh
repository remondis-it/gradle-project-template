#!/bin/bash

echo "Preparing gradle.properties"

cat <<EOF > ~/.gradle/gradle.properties

ossrhUser=${envOssrhUser}
ossrhPassword=${envOssrhPassword}

signing.keyId=${envSigningKeyId}
signing.password=${envSigningPassword}
signing.secretKeyRingFile=./etc/secring.gpg
EOF

echo "Completed gradle.properties"

echo "Decrypting Sign Key..."

gpg --passphrase $envKeyringPassword -o ./etc/secring.gpg -d ./etc/sign.enc

echo "Starting task 'uploadArchives'..."
./gradlew uploadArchives -Prelease

