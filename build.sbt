import ReleaseTransformations._

ThisBuild / organization := "com.gu"
ThisBuild / scalaVersion := "2.13.11"
ThisBuild / licenses += ("Apache-2.0", url("https://www.apache.org/licenses/LICENSE-2.0.html"))

crossScalaVersions := Seq(scalaVersion.value, "2.12.18", "3.3.0")

lazy val scalaModels = project.in(file("."))
  .settings(
    name := "mobile-apps-api-models",

    libraryDependencies ++= Seq(
      "com.thesamet.scalapb" %% "scalapb-runtime" % scalapb.compiler.Version.scalapbVersion % "protobuf"
    ),

    Compile / PB.targets := Seq(
      scalapb.gen() -> (Compile / sourceManaged).value / "scalapb"
    ),

    Compile / PB.protoSources := Seq(baseDirectory.value / "./proto"),
    releaseCrossBuild := true,
    releaseProcess := {
      val process = Seq[ReleaseStep](
        checkSnapshotDependencies,
        inquireVersions,
        runClean,
        runTest,
        setReleaseVersion,
        releaseStepCommandAndRemaining("+publishSigned"),
      )

      if (!isSnapshot.value) {
        process ++ Seq[ReleaseStep](releaseStepCommand("sonatypeBundleRelease"))
      } else {
        process
      }
    }
  )
