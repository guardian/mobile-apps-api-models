import ReleaseTransformations._

ThisBuild / organization := "com.gu"
ThisBuild / scalaVersion := "2.12.11"
ThisBuild / licenses += ("Apache-2.0", url("https://www.apache.org/licenses/LICENSE-2.0.html"))

lazy val commonSettings = Seq(
  Compile / scroogeDisableStrict := true,
  Compile / scroogeThriftSourceFolder := baseDirectory.value / "../src/main/thrift",
)

lazy val scalaModels = project.in(file("models") / "scala")
  .settings(commonSettings)
  .settings(
    name := "mobile-apps-api-models",

    Compile / scroogeLanguages := Seq("scala"),

    libraryDependencies ++= Seq(
      "org.apache.thrift" % "libthrift" % "0.16.0",
      "com.twitter" %% "scrooge-core" % "22.1.0",
    ),


    publishTo := sonatypePublishToBundle.value,

    scmInfo := Some(ScmInfo(
      url("https://github.com/guardian/mobile-apps-api-models"),
      "scm:git:git@github.com:guardian/mobile-apps-api-models.git"
    )),

    homepage := Some(url("https://github.com/guardian/mobile-apps-api-models")),

    developers := List(Developer(
      id = "Guardian",
      name = "Guardian",
      email = null,
      url = url("https://github.com/guardian")
    )),

    releaseProcess := {
      val process = Seq[ReleaseStep](
        checkSnapshotDependencies,
        inquireVersions,
        runClean,
        runTest,
        setReleaseVersion,
        releaseStepCommand("publishSigned"),
      )

      if (!isSnapshot.value) {
        process ++ Seq[ReleaseStep](releaseStepCommand("sonatypeBundleRelease"))
      } else {
        process
      }
    }
  )

lazy val javaModels = project.in(file("models") / "java")
  .settings(commonSettings)
  .settings(
    name := "mobile-apps-api-java-models",

    Compile / scroogeLanguages := Seq("java"),

    libraryDependencies ++= Seq(
      "org.apache.thrift" % "libthrift" % "0.16.0",
      "com.twitter" %% "scrooge-core" % "22.1.0",
    )
  )
