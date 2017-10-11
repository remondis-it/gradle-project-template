[//]: # (~~TODO:~~ Change this readme and describe your project. Give a short introduction with the most significant information and then provide a closer look to your project using the headlines and the table of content to structure the readme file.)

# Gradle Project Template

# Table of Contents
1. [Long story short](#long-story-short)
2. [Getting started](#getting-started)

## Long story short

This is a gradle project template. It can be used to create new projects for publishing open-source libraries. This project template offers the following features:
* Checkstyle rule set and verification in the build process
* Code formatting configuration and verification in the build process
  * Spotless integration. Find out more about spotless [here](https://github.com/diffplug/spotless)
* A contribution guide
* Centralized project metadata in `gradle.properties`
* Project-local Gradle wrapper
* Pre-configured build process
  * Compiling
  * Generating JavaDoc as JAR bundle
  * Generating Sources as JAR bundle
  * Generating a Maven POM file containing the project's metadata. Complies with the [Maven Central OSSRH rules](http://central.sonatype.org/pages/ossrh-guide.html)
  * Publishing the artifacts to Maven Central when the build was started with option `release`.
    * Signing the artifacts with a crypted key
    * Uploading the artifacts to an OSSRH staging repository
* Pre-configured project dependencies
  * JUnit
  * Mockito
  * AssertJ
* Pre-configured build script for [Travis CI](https://travis-ci.org/)
* This beautiful README.md for use as draft for your project's readme.

## Getting started

Clone and check out this template in the latest version. Then copy the content to your empty project and modify the files to fit your needs.

__When starting a new project from this template perform a text search on the string `~~TODO:~~` do find all places that require modification. The comments lead you to the particular decisions to be made about your project settings.__

## Publishing to Maven Central

This project template was created to simplify the project creation for open source projects. Publishing the artifacts produced by a project is the main goal. In order to publish to Maven Central there is a guideline this project template complies to. See [Maven Central OSSRH rules](http://central.sonatype.org/pages/ossrh-guide.html) for more information.

### Signing the artifacts
In order to publish to Maven Central the project's artifacts must be signed. The singing key must be available in the project to be used during the build. __Since you do not want to place an unencrypted signing key in the repository__ the key must be encrypted.

The following instructions where taken from [this article](http://central.sonatype.org/pages/working-with-pgp-signatures.html). To create a crypted signing key, follow this steps:

1. Generate a GPG Key Pair using GnuPG: `gpg --gen-key`.
2. List the keys: `gpg --list-keys` and expect the output to be something similar to `pub   2048R/<YOUR_KEYID_HERE> 2011-08-31 [expires: 2012-02-27]`. Choose your key from the list and remember the id of the key you want to use.
3. Upload the public key to a public key server: `gpg --keyserver hkp://pool.sks-keyservers.net --send-keys <YOUR_KEYID_HERE>` or export the public key in ASCII format with `gpg -a --output public-key.asc --export <YOUR_KEYID_HERE>`. The latter can be used if you want to upload the public key to a server using a webinterface like [MIT PGP Public Key Server](http://pgp.mit.edu/).
5. Export the private key from the keyring with `gpg -a --output private-key.asc --export-secret-keys <YOUR_KEYID_HERE>`
4. Specify a password used to (de)encrypt the private signing key. This password is referenced by `<YOUR_PASSWORD_HERE>` in the following steps.
5. Encrypt your private key using the above generated secret `openssl aes-256-cbc -pass pass:<YOUR_PASSWORD_HERE> -in private-key.asc -out ./sign.enc -a`
6. Place the resulting file `sign.enc` in the project folder `etc`.
7. Configure the following Travis CI build environment variables
  * `envSigningKeyId`: The key id within the private key ring to use for signing
  * `envSigningPassword`: The password for the private key to use for signing
  * `envKeyringPassword`: The password `<YOUR_PASSWORD_HERE>` to deencrypt the private keyring file.