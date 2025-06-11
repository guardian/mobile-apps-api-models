addSbtPlugin("com.github.sbt" % "sbt-release" % "1.4.0")

addSbtPlugin("ch.epfl.scala" % "sbt-version-policy" % "3.2.1")

addSbtPlugin("org.xerial.sbt" % "sbt-sonatype" % "3.12.2")

addSbtPlugin("com.thesamet" % "sbt-protoc" % "1.0.8")

libraryDependencies += "com.thesamet.scalapb" %% "compilerplugin" % "0.11.18"
