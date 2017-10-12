#!/bin/bash

echo "Preparing gradle.properties"

cat <<EOF > ~/.gradle/gradle.properties

ossrhUser=${envOssrhUser}
ossrhPassword=${envOssrhPassword}

signing.keyId=${envSigningKeyId}
signing.password=${envSigningPassword}
signing.secretKeyRingFile=./etc/secring-decrypted.gpg
EOF

echo "Completed gradle.properties"

echo "Decrypting Sign Key..."

md5sum ./etc/sign.enc
openssl aes-256-cbc -d -pass "pass:$envKeyringPassword" -in ./etc/sign.enc -out ./etc/secring-decrypted.gpg
md5sum ./etc/secring-decrypted.gpg

echo "Starting task 'uploadArchives'..."
./gradlew uploadArchives -Prelease

