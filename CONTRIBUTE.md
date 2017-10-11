[//]: # (~~TODO:~~ Change this contribution guide to make it fit your needs or just remove the comments and use this contribution guide.)

# How to contribute

First of all: Feel free to contribute to this project! We appreciate any help to develop this library and make it nice, stable and feature complete.

# Code style and format

This project provides a Checkstyle rule configuration as well as a formatter configuration for Eclipse. This project assumes that you use the Eclipse formatter in your IDE. There are plugins that support formatting using an Eclipse formatter XML for

* [IntelliJ IDEA - Eclipse Code Formatter](https://plugins.jetbrains.com/plugin/6546-eclipse-code-formatter)
* [Netbeans - Eclipse Code Formatter](http://plugins.netbeans.org/plugin/50877/eclipse-code-formatter-for-java-eclipse-mars-4-5)

**Note:** If you do not want to use the IDE for formatting you can start the build of this project with `./gradlew spotlessCheck` to check the current formatting of the files. Use `./gradlew spotlessApply` to simply format the code to match all formatting/styling rules.

The formatter configuration for this project produces code formattings that comply with the checkstyle rules of this project.

## Contribution resources

You can find the Eclipse formatter configuration XML and the Checkstyle rule set in `shared/config`.

[//]: # (~~TODO:~~ Decide if you want to use Lombok and uncomment the paragraph if so.)
[//]: # (This is a comment, it is used to make the Lombok paragraph optional in this template)

[//]: # (## Lombok)

[//]: # (This project uses [Lombok](https://projectlombok.org/) to generate `Object.hashCode()`, `Object.equals()` and get/set-methods. Please visit the Lombok website for additional instructions how to setup your IDE to use Lombok. __You might get compiler errors when building the sources while Lombok isn't active!__)


