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
* This beautiful README.md for use as draft for your project's readme.

## Getting started

When starting a new project from this template perform a text search on the string `~~TODO:~~` do find all places that require modification. The comments lead you to the particular decisions to be made about your project settings.