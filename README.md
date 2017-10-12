[//]: # (~~TODO:~~ Change this readme and describe your project. Give a short introduction with the most significant information and then provide a closer look to your project using the headlines and the table of content to structure the readme file.)

# Gradle Project Template

# Table of Contents
1. [Long story short](#long-story-short)
2. [Getting started](#getting-started)
3. [Publishing to Maven Central](#publishing-to-maven-central)

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

In order to restore the file permissions for the shell scripts in this project run the following command in your project's root folder:

```
git update-index --chmod=+x ./etc/deploy.sh gradlew
git commit -m "Changing file permissions"
```

__When starting a new project from this template perform a text search on the string `~~TODO:~~` do find all places that require modification. The comments lead you to the particular decisions to be made about your project settings.__

## Publishing to Maven Central

This project template was created to simplify the project creation for open source projects. Publishing the artifacts produced by a project is the main goal. In order to publish to Maven Central there is a guideline this project template complies to. See [Maven Central OSSRH rules](http://central.sonatype.org/pages/ossrh-guide.html) for more information.

### Signing the artifacts
In order to publish to Maven Central the project's artifacts must be signed. This project was configured to use a GPG keyring file to sign the artifacts during the build. __Since you do not want to place an unencrypted signing key in the repository__ the keyrinf file will be encrypted.

First of all you need a GPG keyring file containing the private key to be used for signing. Please follow the instructions in [this article](http://central.sonatype.org/pages/working-with-pgp-signatures.html#generating-a-key-pair) to create a GPG keyring file.

Once you created the GPG keyring you can follow this instructions to encrypt it and make the keyring available for this project.

1. Please run the script `./encrypt-keyring-sh` in this project.
2. Specify the path to the GPG keyring file or simply hit [ENTER] to use the keyring file from your home directory.
3. Specify the password to encrypt the keyring file.
4. Retype the password.
5. The script now encrypts the keyring file and writes it to `etc/sign.enc`. __Your encrypted keyring file is now part of this project and will be comitted.__
6. The script gives you a hint which variable must be present in the Travis CI build. Since the variable must be bash-escaped, the script prints out the password in the escaped version. This makes it simple for you to configure the variable in Travis CI.
7. Double check the configuration in Travis CI and make sure that __the flag "Display value in build log" is disabled__ for the secret environment variables.

8. Commit

### How to publish to Maven Central

In order to publish to Maven Central please follow [this instructions](http://central.sonatype.org/pages/ossrh-guide.html). This article describes the steps to get access to OSSRH via a personal account. After this process you were granted access to your staging repository where you can publish artifacts of your registered namespace. Please create a singing key as described [above](#signing-the-artifacts).

This project is configured to publish to an OSSRH staging repository. If the signing key was created and valid the project is able to upload artifacts to the staging repository. The build is pre-configured to perform the neccessary steps. __The upload of artifacts is only triggered on Travis CI builds running on branch "master".__

If the build on branch "master" succeeded, the artifacts are accessible via the [OSS webinterface](https://oss.sonatype.org/#welcome). __In order to release the staged artifacts, perform the close and release operations manually as described [here](http://central.sonatype.org/pages/releasing-the-deployment.html).__