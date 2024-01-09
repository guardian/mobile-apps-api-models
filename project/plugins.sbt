addSbtPlugin("com.github.sbt" % "sbt-release" % "1.3.0")

addSbtPlugin("ch.epfl.scala" % "sbt-version-policy" % "3.2.0")

addSbtPlugin("org.xerial.sbt" % "sbt-sonatype" % "3.9.21")

addSbtPlugin("com.thesamet" % "sbt-protoc" % "1.0.6")

libraryDependencies += "com.thesamet.scalapb" %% "compilerplugin" % "0.11.14"
