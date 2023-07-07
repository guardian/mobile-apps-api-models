import ReleaseTransformations._

ThisBuild / organization := "com.gu"
ThisBuild / scalaVersion := "2.12.17"
ThisBuild / licenses += ("Apache-2.0", url("https://www.apache.org/licenses/LICENSE-2.0.html"))

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
